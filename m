Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02034BCC084
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Oct 2025 10:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F85210EB5C;
	Fri, 10 Oct 2025 08:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ciJBV3hm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7F10EAE6
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:07 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-917be46c59bso122259039f.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032747; x=1760637547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bJf8BKViTw4/xmo503k0SakyhjsE6/pt49DGGacuYc=;
 b=ciJBV3hmb5+ZzfO5UZYylXdWINSLBz245BbyOK5JLEq4r90sBhd/K9MhD3/+Uvi5Lu
 yQzeIK+YL5OfE80noc9PyNMDkDjlcWR3buLMXgqnc6b4qEsVuBUN49FSmESM79QS6v/1
 9C8MC4JHMNiDH2HQYs+TAx0l2h6cxsiRUS4HjrgRl8GY2QBw/cGDM9EpTZ3bvlM2P7+Z
 1Yoem2xeKzVS3WKVJxkRjwo+uNDqlHT2Ju+FewgtDYSJ01k6aAQscQ5NZkl2TBw+vHHb
 uUxiKL7MzTweX2E6cMaJJm4uzoBBpOdklFRMV1nuzaVSxVzkqevqoERDJSwkjK1rvejl
 w11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032747; x=1760637547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bJf8BKViTw4/xmo503k0SakyhjsE6/pt49DGGacuYc=;
 b=nsjlbn6WxiO2TNClDsR1ORY9AyH7LYg1LT4e/Cj80+jtlHhFDfwYbDL/V+6RFYn9j4
 IjcDF+hdqnvNBfxOXXpoVtVMOksNv22JWUtqea9VT/A5uDt92KVeCxFtPRTHQZekkZWv
 kPT/nJLvoXsn4ZPv7u+zqnQk76duwGDUt98QpaLCqxQCdIKJKxmV+YWu+ZzdafJ7Je/s
 pk7v5csW8XYFCQImGZwgLGeUlr8nLLTTCOFroHLZ7/zoBBvGnzHXxIy69uauiOjJsAXA
 IBt3Zmqo74bkUmq/k5mikEvTBi8rCB36jGi7tXosgkjKVLT4MbcKLnFfPKQ1qiE5/xm8
 3vkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHTwvZ3pyZQjv5SkZimN/GqejY7885Xtozom/fcY6/5+Q1Tp0pVxh7N+FBYBmekGPbhYrbcnrt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIgw2uybFaCTgPafsIpjfaEtj+WCEIpvcBwM0r/EMFdGf1uEHb
 Oa5bI7jay2PGLmvmknCVKOl0Nqo18Csn3plJX17Nn92djpZuQCA1GrcU
X-Gm-Gg: ASbGncsN+iT3agB43YITugtWsA0G2Wm9GoVXkTbBacZ222vWCP26GH5aw1xsLt7KAGA
 gZ8FRWbrV3zzmFdhPz3d07+SFJT+Wq41EvJo7hEsdHnvkRe7xXzNHP7vRC0g4Pse5gZi0oBQp2W
 Y6GAWQV8RrMt9Og7u+DEp+xPFWdZMpH0fGbQw3Lt2u+U+UA5gNv3rc7b7WQTWI3+tPqPIxeslVP
 ULNXNeXFZnjQpxhNlYjofNkeft0eoulYNlkoa80HZRxPVz7N3fHcdkPzO3b2QEP7ouFTSOkq7B9
 XGTggICEoJtjEWiB4U25Cl1l/CXL92CeGLC0SKR6xo7A/L+Mi5b3m+P8WjiH2IbfH6rNb9b+TBP
 KDe7wHvqYX46Htz7BtvW+l6IgHTVw0mOrDnJC6LtWh+fSXowjaM5+GKeTeCDDnuUh/nnp35YscI
 mLRtt8Nn5d3azvi/b5H7yh90m+GsZMwm9jdgiM5A==
X-Google-Smtp-Source: AGHT+IEeu7glopTSSuDvCZNhLjHfm129v1CwDFtKO8S4S4IyootPDCsCBoycaw1tuebiZrGvcW8TNg==
X-Received: by 2002:a05:6e02:1543:b0:42f:9410:ea96 with SMTP id
 e9e14a558f8ab-42f9410ec91mr30802035ab.2.1760032746684; 
 Thu, 09 Oct 2025 10:59:06 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 18/30] selftests-dyndbg: add a dynamic_debug run_tests
 target
Date: Thu,  9 Oct 2025 11:58:22 -0600
Message-ID: <20251009175834.1024308-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Oct 2025 08:03:12 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add a selftest script for dynamic-debug.  The config requires
CONFIG_TEST_DYNAMIC_DEBUG=m and CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m,
which tacitly requires either CONFIG_DYNAMIC_DEBUG=y or
CONFIG_DYNAMIC_DEBUG_CORE=y

ATM this has just basic_tests(), which modify pr_debug() flags in the
builtin params module.  This means they're available to manipulate and
observe the effects in "cat control".

This is backported from another feature branch; the support-fns (thx
Lukas) have unused features at the moment, they'll get used shortly.

The script enables simple virtme-ng testing:

   [jimc@gandalf b0-ftrace]$ vrun_t
   virtme-ng 1.32+115.g07b109d
   doing: vng --name v6.14-rc4-60-gd5f48427de0c \
	  --user root -v -p 4 -a dynamic_debug.verbose=3 V=1 \
	  -- ../tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
   virtme: waiting for virtiofsd to start
   ..

And add dynamic_debug to TARGETS, so `make run_tests` sees it properly

For the impatient, set TARGETS explicitly:

  [root@v6 selftests]# make TARGETS=dynamic_debug run_tests
  make[1]: Nothing to be done for 'all'.
  TAP version 13
  1..1
  # timeout set to 45
  # selftests: dynamic_debug: dyndbg_selftest.sh
  # # BASIC_TESTS    95.422122] dyndbg: query 0: 0"=_" mod:*
  # : 0 matches on =p
  # : 4 matches on \[params\[   95.456797] dyndbg: query 0: "module params +]mpf" mod:*
  # : 4 matches on =pmf
  [   95.483070] dyndbg: query 0: "module params =_			# clear params" mod:*
  [   95.483288] dyndbg: query 1: "module params +mf			# set flags" mod:*
  [   95.483399] dyndbg: query 2: "module params func parse_args +sl	# other flags" mod:*
  # : 3 matches on =mf
  # : 1 matches on =mfsl
  [   95.508877] dyndbg: query 0: "=_" mod:*
  #
  # # Done on: Tue Sep  9 03:05:22 PM MDT 2025
  # ok 1 selftests: dynamic_debug: dyndbg_selftest.sh

NOTES

check KCONFIG_CONFIG to avoid silly fails

Several tests are dependent upon config choices. Lets avoid failing
where that is noise.

The KCONFIG_CONFIG var exists to convey the config-file around.  If
the var names a file, read it and extract the relevant CONFIG items,
and use them to skip the dependent tests, thus avoiding the fails that
would follow, and the disruption to whatever CI is running these
selftests.

If the envar doesn't name a config-file, ".config" is assumed.

CONFIG_DYNAMIC_DEBUG=y:

basic-tests() and comma-terminator-tests() test for the presence of
the builtin pr_debugs in module/main.c, which I deemed stable and
therefore safe to count.  That said, the test fails if only
CONFIG_DYNAMIC_DEBUG_CORE=y is set.  It could be rewritten to test
against test-dynamic-debug.ko, but that just trades one config
dependence for another.

CONFIG_TEST_DYNAMIC_DEBUG=m

As written, test_percent_splitting() modprobes test_dynamic_debug,
enables several classes, and counts them.  It could be re-written to
work for the builtin module also, but builtin test modules are not a
common or desirable build/config.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
-r3 turn off green at end
    drop config dep on TEST_DYNAMIC_DEBUG,
    since basic-test uses builtin params
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 257 ++++++++++++++++++
 5 files changed, 275 insertions(+)
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d958c945e4..0db59cca0d4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8617,6 +8617,7 @@ S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
 F:	lib/test_dynamic_debug.c
+F:	tools/testing/selftests/dynamic_debug/*
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 030da61dbff3..3f1a8044e1c0 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -26,6 +26,7 @@ TARGETS += drivers/net/team
 TARGETS += drivers/net/virtio_net
 TARGETS += drivers/platform/x86/intel/ifs
 TARGETS += dt
+TARGETS += dynamic_debug
 TARGETS += efivarfs
 TARGETS += exec
 TARGETS += fchmodat2
diff --git a/tools/testing/selftests/dynamic_debug/Makefile b/tools/testing/selftests/dynamic_debug/Makefile
new file mode 100644
index 000000000000..6d06fa7f1040
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# borrowed from Makefile for user memory selftests
+
+# No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
+all:
+
+TEST_PROGS := dyndbg_selftest.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/dynamic_debug/config b/tools/testing/selftests/dynamic_debug/config
new file mode 100644
index 000000000000..0f906ff53908
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/config
@@ -0,0 +1,7 @@
+
+# basic tests ref the builtin params module
+CONFIG_DYNAMIC_DEBUG=m
+
+# more testing is possible with these
+# CONFIG_TEST_DYNAMIC_DEBUG=m
+# CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
new file mode 100755
index 000000000000..465fad3f392c
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -0,0 +1,257 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+
+V=${V:=0}  # invoke as V=1 $0  for global verbose
+RED="\033[0;31m"
+GREEN="\033[0;32m"
+YELLOW="\033[0;33m"
+BLUE="\033[0;34m"
+MAGENTA="\033[0;35m"
+CYAN="\033[0;36m"
+NC="\033[0;0m"
+error_msg=""
+
+[ -e /proc/dynamic_debug/control ] || {
+    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=y ${NC}"
+    exit 0 # nothing to test here, no good reason to fail.
+}
+
+# need info to avoid failures due to untestable configs
+
+[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=".config"
+if [ -f "$KCONFIG_CONFIG" ]; then
+    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
+    grep -q "CONFIG_DYNAMIC_DEBUG=y" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=m" $KCONFIG_CONFIG ; LACK_TMOD=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m" $KCONFIG_CONFIG ; LACK_TMOD_SUBMOD=$?
+    if [ $V -eq 1 ]; then
+	echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
+	echo LACK_TMOD: $LACK_TMOD
+	echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
+    fi
+else
+    LACK_DD_BUILTIN=0
+    LACK_TMOD=0
+    LACK_TMOD_SUBMOD=0
+fi
+
+function vx () {
+    echo $1 > /sys/module/dynamic_debug/parameters/verbose
+}
+
+function ddgrep () {
+    grep $1 /proc/dynamic_debug/control
+}
+
+function doprints () {
+    cat /sys/module/test_dynamic_debug/parameters/do_prints
+}
+
+function ddcmd () {
+    exp_exit_code=0
+    num_args=$#
+    if [ "${@:$#}" = "pass" ]; then
+	num_args=$#-1
+    elif [ "${@:$#}" = "fail" ]; then
+        num_args=$#-1
+	exp_exit_code=1
+    fi
+    args=${@:1:$num_args}
+    output=$((echo "$args" > /proc/dynamic_debug/control) 2>&1)
+    exit_code=$?
+    error_msg=$(echo $output | cut -d ":" -f 5 | sed -e 's/^[[:space:]]*//')
+    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
+}
+
+function handle_exit_code() {
+    local exp_exit_code=0
+    [ $# == 4 ] && exp_exit_code=$4
+    if [ $3 -ne $exp_exit_code ]; then
+        echo -e "${RED}: $BASH_SOURCE:$1 $2() expected to exit with code $exp_exit_code"
+	[ $3 == 1 ] && echo "Error: '$error_msg'"
+        exit
+    fi
+}
+
+# $1 - pattern to match, pattern in $1 is enclosed by spaces for a match ""\s$1\s"
+# $2 - number of times the pattern passed in $1 is expected to match
+# $3 - optional can be set either to "-r" or "-v"
+#       "-r" means relaxed matching in this case pattern provided in $1 is passed
+#       as is without enclosing it with spaces
+#       "-v" prints matching lines
+# $4 - optional when $3 is set to "-r" then $4 can be used to pass "-v"
+function check_match_ct {
+    pattern="\s$1\s"
+    exp_cnt=0
+
+    [ "$3" == "-r" ] && pattern="$1"
+    let cnt=$(ddgrep "$pattern" | wc -l)
+    if [ $V -eq 1 ] || [ "$3" == "-v" ] || [ "$4" == "-v" ]; then
+        echo -ne "${BLUE}" && ddgrep $pattern && echo -ne "${NC}"
+    fi
+    [ $# -gt 1 ] && exp_cnt=$2
+    if [ $cnt -ne $exp_cnt ]; then
+        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO check failed expected $exp_cnt on $1, got $cnt"
+        exit
+    else
+        echo ": $cnt matches on $1"
+    fi
+}
+
+# $1 - trace instance name
+# #2 - if > 0 then directory is expected to exist, if <= 0 then otherwise
+# $3 - "-v" for verbose
+function check_trace_instance_dir {
+    if [ -e /sys/kernel/tracing/instances/$1 ]; then
+        if [ "$3" == "-v" ] ; then
+            echo "ls -l /sys/kernel/tracing/instances/$1: "
+            ls -l /sys/kernel/tracing/instances/$1
+        fi
+	if [ $2 -le 0 ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
+		    '/sys/kernel/tracing/instances/$1' does exist"
+	    exit
+	fi
+    else
+	if [ $2 -gt 0 ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
+		    '/sys/kernel/tracing/instances/$1' does not exist"
+	    exit
+        fi
+    fi
+}
+
+function tmark {
+    echo $* > /sys/kernel/tracing/trace_marker
+}
+
+# $1 - trace instance name
+# $2 - line number
+# $3 - if > 0 then the instance is expected to be opened, otherwise
+# the instance is expected to be closed
+function check_trace_instance {
+    output=$(tail -n9 /proc/dynamic_debug/control | grep ": Opened trace instances" \
+	    | xargs -n1 | grep $1)
+    if [ "$output" != $1 ] && [ $3 -gt 0 ]; then
+        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not opened"
+        exit
+    fi
+    if [ "$output" == $1 ] && [ $3 -le 0 ]; then
+        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not closed"
+        exit
+    fi
+}
+
+function is_trace_instance_opened {
+    check_trace_instance $1 $BASH_LINENO 1
+}
+
+function is_trace_instance_closed {
+    check_trace_instance $1 $BASH_LINENO 0
+}
+
+# $1 - trace instance directory to delete
+# $2 - if > 0 then directory is expected to be deleted successfully, if <= 0 then otherwise
+function del_trace_instance_dir() {
+    exp_exit_code=1
+    [ $2 -gt 0 ] && exp_exit_code=0
+    output=$((rmdir /sys/kernel/debug/tracing/instances/$1) 2>&1)
+    exit_code=$?
+    error_msg=$(echo $output | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//')
+    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
+}
+
+function error_log_ref {
+    # to show what I got
+    : echo "# error-log-ref: $1"
+    : echo cat \$2
+}
+
+function ifrmmod {
+    lsmod | grep $1 2>&1>/dev/null && rmmod $1
+}
+
+# $1 - text to search for
+function search_trace() {
+    search_trace_name 0 1 $1
+}
+
+# $1 - trace instance name, 0 for global event trace
+# $2 - line number counting from the bottom
+# $3 - text to search for
+function search_trace_name() {
+	if [ "$1" = "0" ]; then
+	    buf=$(cat /sys/kernel/debug/tracing/trace)
+	    line=$(tail -$2 /sys/kernel/debug/tracing/trace | head -1 | sed -e 's/^[[:space:]]*//')
+	else
+	    buf=$(cat /sys/kernel/debug/tracing/instances/$1/trace)
+	    line=$(tail -$2 /sys/kernel/debug/tracing/instances/$1/trace | head -1 | \
+		   sed -e 's/^[[:space:]]*//')
+	fi
+	if [ $2 = 0 ]; then
+	    # whole-buf check
+	    output=$(echo $buf | grep "$3")
+	else
+	    output=$(echo $line | grep "$3")
+	fi
+	if [ "$output" = "" ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO search for '$3' failed \
+		    in line '$line' or '$buf'"
+	    exit
+	fi
+	if [ $V = 1 ]; then
+	    echo -e "${MAGENTA}: search_trace_name in $1 found: \n$output \nin:${BLUE} $buf ${NC}"
+        fi
+}
+
+# $1 - error message to check
+function check_err_msg() {
+    if [ "$error_msg" != "$1" ]; then
+        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error message '$error_msg' \
+		does not match with '$1'"
+        exit
+    fi
+}
+
+function basic_tests {
+    echo -e "${GREEN}# BASIC_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
+    ddcmd =_ # zero everything
+    check_match_ct =p 0
+
+    # module params are builtin to handle boot args
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module params +mpf
+    check_match_ct =pmf 4
+
+    # multi-cmd input, newline separated, with embedded comments
+    cat <<"EOF" > /proc/dynamic_debug/control
+      module params =_				# clear params
+      module params +mf				# set flags
+      module params func parse_args +sl		# other flags
+EOF
+    check_match_ct =mf 3
+    check_match_ct =mfsl 1
+    ddcmd =_
+}
+
+tests_list=(
+    basic_tests
+)
+
+# Run tests
+
+ifrmmod test_dynamic_debug_submod
+ifrmmod test_dynamic_debug
+
+for test in "${tests_list[@]}"
+do
+    $test
+    echo ""
+done
+echo -en "${GREEN}# Done on: "
+date
+echo -en "${NC}"
-- 
2.51.0

