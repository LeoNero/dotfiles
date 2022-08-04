set wallet_1_name user_1
set wallet_2_name user_2
set miner_wallet_name miner

set wallets_names $wallet_1_name $wallet_2_name $miner_wallet_name
set wallets_spend_keys "f78de27b8adba10e1e2b986f2c3b18467288c63a11b1fcbebff21307d64e1008" "a7a46a0fee58ef1659c2d940bffde18da63dbb8d19b545501a36ae9246466907" "608b200321973bb720910233672288bf730d29b6e1a9a750829d1bebd6c90d0a"
set wallets_view_keys  "eb77325ea53e0152c63ccc7d77e7618b02a15e31c452b7ef0005296d4499e201" "bfaea1e548735bd38666b166622f719b99b8f56fa887da0639c909d834819708" "e89b33d2af4b7de82ffe63db5e70d931cc87b1f230e089506ac127408746eb0c"
set wallets_mainnet_addresses "46N8qSRp9GXG8BLt7oHhxzCbpeDQ7ENuHCCsxhHzxQQiRw8GPHsFa2qfrmhgzE6Vt56JropL7rgnnJ7QVNqGzqKWSta8bTM" "41pkzuEmAKDEY8jyH7oq3Yc2XAEP5Ci43b7sSYgeR91UKFTu8hv5BX5PSuq3zAw1de2Qdrv8NyA69ag38oTSwhawSWRGJyZ" "44oZj1HTt9r37veBjawXFJV9Dum35XydXhtzf5Qbj2fcXpj6HKN9xtPhdf3xayqf4XTPmVEy1eWacSgBReRFu9dxJDW8Tcz"

function create_wallet
    set -l wallet_name $argv[1]
    set -l index (contains -i -- $wallet_name $wallets_names)

    set -l wallet_file_path (pwd)/wallets/$wallet_name
    set -l wallet_log_file_path "$(pwd)/wallets/logs/$wallet_name.log"
    set -l wallet_json_file "$(pwd)/$wallet_name.json"

    touch $wallet_json_file

    echo "{\"version\": 1, \"filename\": \"$wallet_file_path\", \"viewkey\": \"$wallets_view_keys[$index]\", \"spendkey\": \"$wallets_spend_keys[$index]\", \"scan_from_height\": 0, \"password\": \"\"}" > $wallet_json_file

    # echo anything to exit cli after wallet is generated
    echo '' | wallet-cli --generate-from-json $wallet_json_file --log-file $wallet_log_file_path

    rm $wallet_json_file

end

function create_wallets
    create_wallet $wallet_1_name
    create_wallet $wallet_2_name
    create_wallet $miner_wallet_name
end

function check_wallet_name
    set -l cmd_name $argv[1]
    set -l wallet_name $argv[2]

    if test -z "$wallet_name"
        echo "Usage: $cmd_name requires a wallet name as argument"
        return 1
    end

    if not contains $wallet_name $wallets_names
        echo "Usage: invalid wallet name passed to $cmd_name"
        return 1
    end
end

function start_wallet_cli
    set -l wallet_name $argv[1]
    if not check_wallet_name "start_wallet_cli" $wallet_name
        return 1
    end

    wallet-cli \
        --daemon-port 18081 \
        --trusted-daemon \
        --wallet-file (pwd)/wallets/$wallet_name \
        --password '' \
        --log-file (pwd)/wallets/logs/$wallet_name.log
end

function start_wallets_rpc
    wallet-rpc \
        --disable-rpc-login \
        --wallet-dir (pwd)/wallets \
        --daemon-address http://localhost:18081 \
        --rpc-bind-ip 0.0.0.0 \
        --rpc-bind-port 18083 \
        --confirm-external-bind \
        --trusted-daemon \
        --log-level 1
end

# run_wallet_cmd method_name params[something]=something [wallet_name]
function run_wallet_cmd
    if contains $argv[-1] $wallets_names
        set -l wallet_name $argv[-1]
        http :18083/json_rpc jsonrpc=2.0 id=1 method=open_wallet params[filename]=$wallet_name > /dev/null

        set method $argv[1]
        set method_args $argv[2..-2]
    else
        set method $argv[1]
        set method_args $argv[2..]
    end

    if not test -z "$method"
        http :18083/json_rpc jsonrpc=2.0 id=1 method=$method $method_args
    end
end

# start_monerod keep_fakechain
# keep_fakechain = true or false
function start_monerod
    if test -z "$argv[1]"; or test "$argv[1]" != "true" -a "$argv[1]" != "false"
        echo "Usage: start_monerod receives a second argument {true,false} to indicate whether it should keep the fakechain or not"
        return 1
    end

    set -l opts --regtest \
        --p2p-bind-ip 0.0.0.0 \
        --rpc-bind-ip 0.0.0.0 \
        --zmq-rpc-bind-ip 0.0.0.0 \
        --p2p-bind-port 18080 \
        --rpc-bind-port 18081 \
        --zmq-rpc-bind-port 18082 \
        --no-igd \
        --hide-my-port \
        --confirm-external-bind \
        --offline \
        --fixed-difficulty 1 \
        --data-dir (pwd)/node_01 \
        --log-level 0 \
        --log-file (pwd)/node_01/log

    if test "$argv[1]" = "true"
        monerod --keep-fakechain $opts
    else
        monerod $opts
    end
end

# run_monerod_cmd method_name params[something]=something
function run_monerod_cmd
    set -l method $argv[1]

    if test $method = "get_transactions" -o $method = "get_height"
        http :18081/$method $argv[2..]
    else
        http :18081/json_rpc jsonrpc=2.0 id=1 method=$method $argv[2..]
    end
end

# mine_blocks [wallet_address|wallet_name] [amount_of_blocks]
function mine_blocks
    set -l amount_of_blocks 10
    set -l wallet_address $wallets_mainnet_addresses[3] # miner address

    if test (count $argv) = 1 -o (count $argv) = 2
        set wallet_address $argv[1]

        set -l index (contains -i -- $wallet_address $wallets_names)
        if not test -z "$index"
            set wallet_address $wallets_mainnet_addresses[$index]
        end
    end

    if test (count $argv) = 2
        set amount_of_blocks $argv[2]
    end

    run_monerod_cmd generateblocks params[amount_of_blocks]=$amount_of_blocks params[wallet_address]=$wallet_address
end

function monero-utils
    if test -z "$argv"
        echo "Usage: no arguments passed"
        return 1
    end

    switch $argv[1]
    case "create_wallets"
        create_wallets
    case "start_wallet_cli"
        start_wallet_cli $argv[2]
    case "start_wallets_rpc"
        start_wallets_rpc
    case "run_wallet_cmd"
        run_wallet_cmd $argv[2..]
    case "start_monerod"
        start_monerod $argv[2]
    case "run_monerod_cmd"
        run_monerod_cmd $argv[2..]
    case "mine_blocks"
        mine_blocks $argv[2..]
    case "*"
        echo "Usage: invalid command"
        return 1
    end
end
