Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6C74901F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C0389F85;
	Mon, 17 Jun 2019 19:47:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF7F89F3C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so12277199qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ApXt037p046jaMv1Ljp/8QPCOYyO/AgW0KN7gXZL7k=;
 b=ocWJQZ0OdHwtrnGwMzwCki+iZzNgnYCZZYKbb0DW6bQ6/LLxOmPoW+S9qLMnZGxWmh
 VRygYI+/BiM01H/lXINf3WvNJDwTRIZbNJs3/Izp/V6f8aJHbHHp4tW6VSTUV+SOp7lw
 OZcLqnnbAcECXKhacYAYL8RnWW4xBt6MPdf1HKWCNRL40/t5YLZ4UoeIyZEdyO5CkfSB
 EbjwBppw67SRLdjB9vAEG9R2GVUytYxvyDz1mLGrngBtNs62bYvkam/0Uw/X1ijgjGyu
 hRdQGJ8fi1wa4faabgNyQgU7JUNeB0ETEU6ggWecmViUB0AYImwo5NHM0/iBIc37FrNu
 PuyQ==
X-Gm-Message-State: APjAAAWct0HF7nOaauMskqZ1WsblhBVRICOKEzRQFT7InjpZNS06sdGe
 Wq85JzDpkqUxwQ0Tbu8k3N1AFvlFDIGTCw==
X-Google-Smtp-Source: APXvYqxk7F+O6aCvCNT6piZRjhEuolQuwpOI9dRjcZsrGFXijHD5nCicDZmR20ZoLrX1FpcDv+IcXQ==
X-Received: by 2002:ac8:42d4:: with SMTP id g20mr96145760qtm.78.1560800827893; 
 Mon, 17 Jun 2019 12:47:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 371/459] drm/amd/display: remove legacy DSC functions
Date: Mon, 17 Jun 2019 14:45:12 -0500
Message-Id: <20190617194540.18497-72-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ApXt037p046jaMv1Ljp/8QPCOYyO/AgW0KN7gXZL7k=;
 b=PMp5f4W02WypeGLLBNXKzS54oNnNCIc3EuZRgqXGNrhK8IiukHkS/nCnFoetNKKTlj
 lVaG9oOqxpU13UYeHTgZv6lNTVLR6HJ+Det+sZsacRcHteaQ6ipTFh4EmgGX8bI4Ux2y
 wQz3JzWaWGci++gNqFjZ73A8+TDxXP8cDGswxZx+1/KkcUFegkfBQlHq4VN3GtYPQe9O
 ZK9nn17z9TFAKbsbo3K6r3k72Dz5hREjCMYbvVxoEoREgjI/sF2rwiOxkby+x+4JuaKc
 ZpuGqQ+G/9ugBr/3/MwYztXtj68mj8mPtf64J0M6HZOOqzRsvW1ST7fG75mj0ISexhHB
 kSdg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpDbGVhbiB1cCBz
b21lIGRzYyBsZWdhY3kgZnVuY3Rpb25zIHRoYXQgYXJlCm5vIGxvbmdlciBuZWVkZWQuCgpbaG93
XQpyZW1vdmUgdHdvIGRzYyBmdW5jdGlvbnMgaW4gZGNfZHNjLCB1c2UgZGNfYmFuZHdpZHRoX2lu
X2ticHNfZnJvbV90aW1pbmcKaW5zdGVhZCBvZiBjYWxjX3JlcXVpcmVkX2JhbmR3aWR0aF9mb3Jf
dGltaW5nLgoKU2lnbmVkLW9mZi1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+
ClJldmlld2VkLWJ5OiBOaWtvbGEgQ29ybmlqIDxOaWtvbGEuQ29ybmlqQGFtZC5jb20+CkFja2Vk
LWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY19kc2MuaCAgICAgfCAgMTAgLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kc2MvZGNfZHNjLmMgfCAxMjMgKystLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RzYy5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjX2RzYy5oCmluZGV4IGMzYTI3N2MxMTQ4OS4uMmNiYTZiZDc5Mzdh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHNjLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RzYy5oCkBAIC00NywxNSArNDcs
NSBAQCBib29sIGRjX2RzY19jb21wdXRlX2NvbmZpZygKIAkJaW50IHRhcmdldF9iYW5kd2lkdGgs
CiAJCWNvbnN0IHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nLAogCQlzdHJ1Y3QgZGNfZHNj
X2NvbmZpZyAqZHNjX2NmZyk7Ci0KLWJvb2wgZGNfY2hlY2tfYW5kX2ZpdF90aW1pbmdfaW50b19i
YW5kd2lkdGhfd2l0aF9kc2NfbGVnYWN5KAotCQljb25zdCBzdHJ1Y3QgZGMgKnBEQywKLQkJY29u
c3Qgc3RydWN0IGRjX2xpbmsgKmxpbmssCi0JCXN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5n
KTsKLQotYm9vbCBkY19zZXR1cF9kc2NfaW5fdGltaW5nX2xlZ2FjeShjb25zdCBzdHJ1Y3QgZGMg
KnBEQywKLQkJY29uc3Qgc3RydWN0IGRzY19kZWNfZHBjZF9jYXBzICpkc2Nfc2lua19jYXBzLAot
CQlpbnQgYXZhaWxhYmxlX2JhbmR3aWR0aF9rYnBzLAotCQlzdHJ1Y3QgZGNfY3J0Y190aW1pbmcg
KnRpbWluZyk7CiAjZW5kaWYKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kc2MvZGNfZHNjLmMKaW5kZXggOWU5Yzc3ZTQ3MmUxLi5mZTYzYWY4MzZmMWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYwpAQCAtMjMxLDY2ICsyMzEs
NiBAQCBzdGF0aWMgYm9vbCBkY19pbnRlcnNlY3RfZHNjX2NhcHMoCiAJcmV0dXJuIHRydWU7CiB9
CiAKLS8vIFRPRE8gRFNDOiBDYW4gdGhpcyBiZSBtb3ZlZCB0byBhIGNvbW1vbiBoZWxwZXIgbW9k
dWxlIGFuZCByZXBsYWNlIFdpbmRvd3NETTo6Y2FsY1JlcXVpcmVkQmFuZHdpZHRoRm9yVGltaW5n
KCk/Ci1zdGF0aWMgaW50IGJwcF9mcm9tX2RjX2NvbG9yX2RlcHRoKGVudW0gZGNfY29sb3JfZGVw
dGggY29sb3JfZGVwdGgpCi17Ci0JaW50IGJpdHNfcGVyX3BpeGVsOwotCi0JLy8gR2V0IGNvbG9y
IGRlcHRoIGluIGJpdHMgcGVyIHBpeGVsCi0Jc3dpdGNoIChjb2xvcl9kZXB0aCkgewotCWNhc2Ug
Q09MT1JfREVQVEhfVU5ERUZJTkVEOgotCQliaXRzX3Blcl9waXhlbCA9IDA7Ci0JCWJyZWFrOwot
CWNhc2UgQ09MT1JfREVQVEhfNjY2OgotCQliaXRzX3Blcl9waXhlbCA9IDY7Ci0JCWJyZWFrOwot
CWNhc2UgQ09MT1JfREVQVEhfODg4OgotCQliaXRzX3Blcl9waXhlbCA9IDg7Ci0JCWJyZWFrOwot
CWNhc2UgQ09MT1JfREVQVEhfMTAxMDEwOgotCQliaXRzX3Blcl9waXhlbCA9IDEwOwotCQlicmVh
azsKLQljYXNlIENPTE9SX0RFUFRIXzEyMTIxMjoKLQkJYml0c19wZXJfcGl4ZWwgPSAxMjsKLQkJ
YnJlYWs7Ci0JY2FzZSBDT0xPUl9ERVBUSF8xNDE0MTQ6Ci0JCWJpdHNfcGVyX3BpeGVsID0gMTQ7
Ci0JCWJyZWFrOwotCWNhc2UgQ09MT1JfREVQVEhfMTYxNjE2OgotCQliaXRzX3Blcl9waXhlbCA9
IDE2OwotCQlicmVhazsKLQljYXNlIENPTE9SX0RFUFRIXzk5OToKLQkJYml0c19wZXJfcGl4ZWwg
PSA5OwotCQlicmVhazsKLQljYXNlIENPTE9SX0RFUFRIXzExMTExMToKLQkJYml0c19wZXJfcGl4
ZWwgPSAxMTsKLQkJYnJlYWs7Ci0JY2FzZSBDT0xPUl9ERVBUSF9DT1VOVDoKLQlkZWZhdWx0Ogot
CQliaXRzX3Blcl9waXhlbCA9IDA7Ci0JCWJyZWFrOwotCX0KLQotCXJldHVybiBiaXRzX3Blcl9w
aXhlbDsKLX0KLQotLy8gVE9ETyBEU0M6IENhbiB0aGlzIGJlIG1vdmVkIHRvIGEgY29tbW9uIGhl
bHBlciBtb2R1bGUgYW5kIHJlcGxhY2UgV2luZG93c0RNOjpjYWxjUmVxdWlyZWRCYW5kd2lkdGhG
b3JUaW1pbmcoKT8KLXN0YXRpYyBpbnQgY2FsY19yZXF1aXJlZF9iYW5kd2lkdGhfZm9yX3RpbWlu
Zyhjb25zdCBzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgKmNydGNfdGltaW5nKQotewotCWludCB0aW1p
bmdfYmFuZHdpZHRoX2ticHMgPSAwOwotCWludCBiaXRzX3Blcl9waXhlbCA9IGJwcF9mcm9tX2Rj
X2NvbG9yX2RlcHRoKGNydGNfdGltaW5nLT5kaXNwbGF5X2NvbG9yX2RlcHRoKTsKLQotCWlmIChj
cnRjX3RpbWluZy0+cGl4ZWxfZW5jb2RpbmcgPT0gUElYRUxfRU5DT0RJTkdfUkdCIHx8Ci0JCWNy
dGNfdGltaW5nLT5waXhlbF9lbmNvZGluZyA9PSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQ0NCkKLQkJ
dGltaW5nX2JhbmR3aWR0aF9rYnBzID0gY3J0Y190aW1pbmctPnBpeF9jbGtfMTAwaHogKiBiaXRz
X3Blcl9waXhlbCAqIDMgLyAxMDsKLQllbHNlIGlmIChjcnRjX3RpbWluZy0+cGl4ZWxfZW5jb2Rp
bmcgPT0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjIpCi0JCXRpbWluZ19iYW5kd2lkdGhfa2JwcyA9
IGNydGNfdGltaW5nLT5waXhfY2xrXzEwMGh6ICogOCAqIDMgLyAxMDsKLQllbHNlIGlmIChjcnRj
X3RpbWluZy0+cGl4ZWxfZW5jb2RpbmcgPT0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjApCi0JCXRp
bWluZ19iYW5kd2lkdGhfa2JwcyA9IGNydGNfdGltaW5nLT5waXhfY2xrXzEwMGh6ICogYml0c19w
ZXJfcGl4ZWwgKiAzIC8gMjA7Ci0KLQlyZXR1cm4gdGltaW5nX2JhbmR3aWR0aF9rYnBzOwotfQot
CiBzdHJ1Y3QgZGNfZHNjX3BvbGljeSB7CiAJZmxvYXQgbWF4X2NvbXByZXNzaW9uX3JhdGlvX2xl
Z2FjeTsKIAlmbG9hdCBzc3RfY29tcHJlc3Npb25fbGVnYWN5OyAvLyBNYXhpbXVtIHF1YWxpdHkg
aWYgMC4wCkBAIC0zNDYsNyArMjg2LDcgQEAgc3RhdGljIHZvaWQgZ2V0X2RzY19iYW5kd2lkdGhf
cmFuZ2UoCiAJCXN0cnVjdCBkY19kc2NfYndfcmFuZ2UgKnJhbmdlKQogewogCS8qIG5hdGl2ZSBz
dHJlYW0gYmFuZHdpZHRoICovCi0JcmFuZ2UtPnN0cmVhbV9rYnBzID0gY2FsY19yZXF1aXJlZF9i
YW5kd2lkdGhfZm9yX3RpbWluZyh0aW1pbmcpOworCXJhbmdlLT5zdHJlYW1fa2JwcyA9IGRjX2Jh
bmR3aWR0aF9pbl9rYnBzX2Zyb21fdGltaW5nKHRpbWluZyk7CiAKIAkvKiBtYXggZHNjIHRhcmdl
dCBicHAgKi8KIAlyYW5nZS0+bWF4X2ticHMgPSBkc2Nfcm91bmRfdXAocG9saWN5LT5tYXhfdGFy
Z2V0X2JwcCAqIHRpbWluZy0+cGl4X2Nsa18xMDBoeik7CkBAIC0zNjcsNiArMzA3LDEzIEBAIHN0
YXRpYyB2b2lkIGdldF9kc2NfYmFuZHdpZHRoX3JhbmdlKAogCX0KIH0KIAorLyogRGVjaWRlcyBp
ZiBEU0Mgc2hvdWxkIGJlIHVzZWQgYW5kIGNhbGN1bGF0ZXMgdGFyZ2V0IGJwcCBpZiBpdCBzaG91
bGQsIGFwcGx5aW5nIERTQyBwb2xpY3kuCisgKgorICogUmV0dXJuczoKKyAqICAgICAtICd0cnVl
JyBpZiBEU0Mgd2FzIHJlcXVpcmVkIGJ5IHBvbGljeSBhbmQgd2FzIHN1Y2Nlc3NmdWxseSBhcHBs
aWVkCisgKiAgICAgLSAnZmFsc2UnIGlmIERTQyB3YXMgbm90IG5lY2Vzc2FyeSAoZS5nLiBpZiB1
bmNvbXByZXNzZWQgc3RyZWFtIGZpdHMgJ3RhcmdldF9iYW5kd2lkdGgnKSwKKyAqICAgICAgICBv
ciBpZiBpdCBjb3VsZG4ndCBiZSBhcHBsaWVkIGJhc2VkIG9uIERTQyBwb2xpY3kuCisgKi8KIHN0
YXRpYyBib29sIGRlY2lkZV9kc2NfdGFyZ2V0X2JwcF94MTYoCiAJCWNvbnN0IHN0cnVjdCBkY19k
c2NfcG9saWN5ICpwb2xpY3ksCiAJCWNvbnN0IHN0cnVjdCBkc2NfZW5jX2NhcHMgKmRzY19jb21t
b25fY2FwcywKQEAgLTQwMiw3ICszNDksNiBAQCBzdGF0aWMgYm9vbCBkZWNpZGVfZHNjX3Rhcmdl
dF9icHBfeDE2KAogCXJldHVybiBzaG91bGRfdXNlX2RzYzsKIH0KIAotCiAjZGVmaW5lIE1JTl9B
VkFJTEFCTEVfU0xJQ0VTX1NJWkUgIDQKIAogc3RhdGljIGludCBnZXRfYXZhaWxhYmxlX2RzY19z
bGljZXModW5pb24gZHNjX2VuY19zbGljZV9jYXBzIHNsaWNlX2NhcHMsIGludCAqYXZhaWxhYmxl
X3NsaWNlcykKQEAgLTU4OCw3ICs1MzQsNyBAQCBzdGF0aWMgYm9vbCBzZXR1cF9kc2NfY29uZmln
KAogCiAJaWYgKHRhcmdldF9iYW5kd2lkdGggPiAwKSB7CiAJCWlzX2RzY19wb3NzaWJsZSA9IGRl
Y2lkZV9kc2NfdGFyZ2V0X2JwcF94MTYoJmRzY19wb2xpY3ksICZkc2NfY29tbW9uX2NhcHMsIHRh
cmdldF9iYW5kd2lkdGgsIHRpbWluZywgJnRhcmdldF9icHApOwotCX0gZWxzZSBpZiAodGltaW5n
LT5waXhfY2xrXzEwMGh6ICogMTIgPD0gY2FsY19yZXF1aXJlZF9iYW5kd2lkdGhfZm9yX3RpbWlu
Zyh0aW1pbmcpICogMTApIHsKKwl9IGVsc2UgaWYgKHRpbWluZy0+cGl4X2Nsa18xMDBoeiAqIDEy
IDw9IGRjX2JhbmR3aWR0aF9pbl9rYnBzX2Zyb21fdGltaW5nKHRpbWluZykgKiAxMCkgewogCQkv
KiB1c2UgMTIgdGFyZ2V0IGJwcCBmb3IgTVNUIGRpc3BsYXkKIAkJICogVE9ETzogaW1wbGVtZW50
IG5ldyBNU1QgRFNDIHRhcmdldCBicHAgcG9saWN5ICovCiAJCXRhcmdldF9icHAgPSAxNioxMjsK
QEAgLTg0MSw1NSArNzg3LDQgQEAgYm9vbCBkY19kc2NfY29tcHV0ZV9jb25maWcoCiAJCQkJdGlt
aW5nLCBkc2NfY2ZnKTsKIAlyZXR1cm4gaXNfZHNjX3Bvc3NpYmxlOwogfQotCi1ib29sIGRjX2No
ZWNrX2FuZF9maXRfdGltaW5nX2ludG9fYmFuZHdpZHRoX3dpdGhfZHNjX2xlZ2FjeSgKLQkJY29u
c3Qgc3RydWN0IGRjICpwREMsCi0JCWNvbnN0IHN0cnVjdCBkY19saW5rICpsaW5rLAotCQlzdHJ1
Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZykKLXsKLQlpbnQgcmVxdWlyZWRCYW5kd2lkdGhfS2Jw
czsKLQlib29sIHN0cmVhbV9maXRzX2ludG9fYmFuZHdpZHRoID0gZmFsc2U7Ci0JaW50IHRvdGFs
X2xpbmtfYmFuZHdkaXRoX2ticHMgPSBkY19saW5rX2JhbmR3aWR0aF9rYnBzKGxpbmssICZsaW5r
LT52ZXJpZmllZF9saW5rX2NhcCk7Ci0KLQlpZiAobGluay0+cHJlZmVycmVkX2xpbmtfc2V0dGlu
Zy5sYW5lX2NvdW50ICE9IExBTkVfQ09VTlRfVU5LTk9XTiAmJgotCQkJbGluay0+cHJlZmVycmVk
X2xpbmtfc2V0dGluZy5saW5rX3JhdGUgIT0gTElOS19SQVRFX1VOS05PV04pIHsKLQkJdG90YWxf
bGlua19iYW5kd2RpdGhfa2JwcyA9IGRjX2xpbmtfYmFuZHdpZHRoX2ticHMobGluaywgJmxpbmst
PnByZWZlcnJlZF9saW5rX3NldHRpbmcpOwotCX0KLQotCXRpbWluZy0+ZmxhZ3MuRFNDID0gMDsK
LQlyZXF1aXJlZEJhbmR3aWR0aF9LYnBzID0gY2FsY19yZXF1aXJlZF9iYW5kd2lkdGhfZm9yX3Rp
bWluZyh0aW1pbmcpOwotCi0JaWYgKHRvdGFsX2xpbmtfYmFuZHdkaXRoX2ticHMgPj0gcmVxdWly
ZWRCYW5kd2lkdGhfS2JwcykKLQkJc3RyZWFtX2ZpdHNfaW50b19iYW5kd2lkdGggPSB0cnVlOwot
CWVsc2UgewotCQkvLyBUaGVyZSdzIG5vdCBlbm91Z2ggYmFuZHdpZHRoIGluIHRoZSBsaW5rLiBT
ZWUgaWYgRFNDIGNhbiBiZSB1c2VkIHRvIHJlc29sdmUgdGhpcy4KLQkJaW50IGxpbmtfYmFuZHdp
ZHRoX2ticHMgPSBsaW5rLT50eXBlID09IGRjX2Nvbm5lY3Rpb25fbXN0X2JyYW5jaCA/IDAgOiB0
b3RhbF9saW5rX2JhbmR3ZGl0aF9rYnBzOwotCi0JCXN0cmVhbV9maXRzX2ludG9fYmFuZHdpZHRo
ID0gZGNfc2V0dXBfZHNjX2luX3RpbWluZ19sZWdhY3kocERDLCAmbGluay0+ZHBjZF9jYXBzLmRz
Y19zaW5rX2NhcHMsIGxpbmtfYmFuZHdpZHRoX2ticHMsIHRpbWluZyk7Ci0JfQotCi0JcmV0dXJu
IHN0cmVhbV9maXRzX2ludG9fYmFuZHdpZHRoOwotfQotCi1ib29sIGRjX3NldHVwX2RzY19pbl90
aW1pbmdfbGVnYWN5KGNvbnN0IHN0cnVjdCBkYyAqcERDLAotCQljb25zdCBzdHJ1Y3QgZHNjX2Rl
Y19kcGNkX2NhcHMgKmRzY19zaW5rX2NhcHMsCi0JCWludCBhdmFpbGFibGVfYmFuZHdpZHRoX2ti
cHMsCi0JCXN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nKQotewotCWJvb2wgaXNEc2NPSyA9
IGZhbHNlOwotCXN0cnVjdCBkc2NfZW5jX2NhcHMgZHNjX2VuY19jYXBzOwotCi0JdGltaW5nLT5m
bGFncy5EU0MgPSAwOwotCWdldF9kc2NfZW5jX2NhcHMocERDLCAmZHNjX2VuY19jYXBzLCB0aW1p
bmctPnBpeF9jbGtfMTAwaHopOwotCWlmIChkc2NfZW5jX2NhcHMuZHNjX3ZlcnNpb24pIHsKLQkJ
c3RydWN0IGRjX2RzY19jb25maWcgZHNjQ2ZnID0gezB9OwotCi0JCWlzRHNjT0sgPSBzZXR1cF9k
c2NfY29uZmlnKGRzY19zaW5rX2NhcHMsICZkc2NfZW5jX2NhcHMsIGF2YWlsYWJsZV9iYW5kd2lk
dGhfa2JwcywgdGltaW5nLCAmZHNjQ2ZnKTsKLQotCQltZW1jcHkoJnRpbWluZy0+ZHNjX2NmZywg
JmRzY0NmZywgc2l6ZW9mKGRzY0NmZykpOwotCQl0aW1pbmctPmZsYWdzLkRTQyA9IGlzRHNjT0sg
PyAxIDogMDsKLQl9Ci0KLQlyZXR1cm4gaXNEc2NPSzsKLX0KICNlbmRpZiAvKiBDT05GSUdfRFJN
X0FNRF9EQ19EU0NfU1VQUE9SVCAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
