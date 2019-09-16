Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7BB3A7F
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 14:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6926A6E967;
	Mon, 16 Sep 2019 12:40:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEB36E181
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 09:03:43 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id a24so298288pgj.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 02:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t36Z/jGEbN49mUV+tXmxMTYXgyNkfhBtlJVe2gYnsdE=;
 b=R3b3QUdxQWHkg2Y2DEerSuxl0Rpd4IfRJz9U80r24414GSUs36pxYsX4FLq26EyiIW
 lQ+BzBZeZycjpzeBiizfuVrBWhUXDPFbb8pPTKUmzDQJHWHUb7PyXL+YvrNBvG+er12B
 /7T2VUQPB6oqvE0eeBcxp48nYstK7QR0A9voXBwmWsdEdmbc0ny6A8cI9eQ5lEVCep2k
 QPhBwpfn18tFabZ3T/hIQu0zzgVpss4dASFfD5JSYU1pp4LCDlERbJmhumicar4CT6qw
 9sh6wECbCwwm628TvQSI9wbH4qGa2oR5oVrG4GSv7IN1wxdtJ+sauc6okGyv5qj+d+KU
 OSYA==
X-Gm-Message-State: APjAAAW93+OC8z/QvxdGA0QNzgWHjqL5OW3UnSgXFcoyGV/GLN3Ot3LF
 UV9rCQ9wYf5DUv934MaxtAw=
X-Google-Smtp-Source: APXvYqx3uvIYst0MMlMB4MJLV04XVVemOC2t2kPEPmyiYGV3R3xPt2YOHjU4fRCQACD1q8XN0aG/ZA==
X-Received: by 2002:aa7:84d5:: with SMTP id x21mr5465155pfn.253.1568624622986; 
 Mon, 16 Sep 2019 02:03:42 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([218.189.25.30])
 by smtp.gmail.com with ESMTPSA id x23sm8167608pfq.140.2019.09.16.02.03.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 02:03:42 -0700 (PDT)
From: Xinpeng Liu <danielliu861@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, Bhawanpreet.Lakha@amd.com,
 ndesaulniers@google.com, Jun.Lei@amd.com, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: build failed for DCN2.1
Date: Mon, 16 Sep 2019 17:03:27 +0800
Message-Id: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 16 Sep 2019 12:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=t36Z/jGEbN49mUV+tXmxMTYXgyNkfhBtlJVe2gYnsdE=;
 b=J0dKrP3Om+XiOVAp2ewCCtoZuQMdhOKquufwyk0S61mAdfU/Y9mOVA05vp74uHAlqH
 fJyHZb/EgpSY8sFhcjtREP9p2X4GA3059aqT7bMYhJShyvy3ZvwFPBtWwQAjWlQFT8ES
 8ieW6IiDyhBl7x5JSzmWPzQ2pVTVUKAjTbp8it34S5/ACnVhC0LH9ZGYthpxX6khqc/5
 BFfA8RoCMCKie9xO35X4gctoKkEAVp7R8tTCNTS0bmfulwoc/FO6qV7vqDELm4q6t1j1
 7Ef+QsERkTskVZiqzn4umR6+lQIllfMDtmQdHJIRAdCv9FHlFyS69q4YQkRNY9benuN9
 QMdg==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Xinpeng Liu <danielliu861@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvTWFrZWZpbGU6NzA6
ICoqKiBtaXNzaW5nCmBlbmRpZicuICBTdG9wLgptYWtlWzRdOiAqKiogW2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1XSBFcnJvciAyCgpTaWduZWQtb2ZmLWJ5OiBYaW5wZW5nIExpdSA8ZGFuaWVs
bGl1ODYxQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1s
L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZQppbmRleCBhMmViNTllLi41YjJh
NjViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2Vm
aWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUKQEAg
LTQ0LDYgKzQ0LDcgQEAgQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlf
bW9kZV92YmFfMjAubyA6PSAkKGRtbF9jY2ZsYWdzKQogQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMv
ZG1sL2RjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjAubyA6PSAkKGRtbF9jY2ZsYWdzKQogQ0ZM
QUdTXyQoQU1EREFMUEFUSCkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5vIDo9
ICQoZG1sX2NjZmxhZ3MpCiBDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNuMjAvZGlzcGxh
eV9ycV9kbGdfY2FsY18yMHYyLm8gOj0gJChkbWxfY2NmbGFncykKK2VuZGlmCiBpZmRlZiBDT05G
SUdfRFJNX0FNRF9EQ19EQ04yXzEKIENGTEFHU18kKEFNRERBTFBBVEgpL2RjL2RtbC9kY24yMS9k
aXNwbGF5X21vZGVfdmJhXzIxLm8gOj0gJChkbWxfY2NmbGFncykKIENGTEFHU18kKEFNRERBTFBB
VEgpL2RjL2RtbC9kY24yMS9kaXNwbGF5X3JxX2RsZ19jYWxjXzIxLm8gOj0gJChkbWxfY2NmbGFn
cykKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
