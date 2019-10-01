Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD64C43C5
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 00:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A14C6E8B3;
	Tue,  1 Oct 2019 22:21:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D496E8B3
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 22:21:31 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id l2so10532017vsr.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Oct 2019 15:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=/GxgPAGbX6e7ziJoAFf2TeaerFxc0fyk9xIacgUDW0o=;
 b=rspbU0T3MbEXDQy0dqC0/C5Gtcn9Lp+y7IWuVdqMNR+qcj3xc83Y+pdiPCewfiyvYO
 PeTiF1rbbViwMlJhl8keA346wXBE1fupOvTXXTv9OwdY9c6N79vD8rhIKL2/aLjkMTv5
 oZgecqvfE/5M/kTU4OLnrfDncxqTzIcKBJgYysQntJUGOjNLT6vTR9j0IqR13kf3Xpa5
 7AjhSCAbqPzkOBgriEH6Ss44x3HDKHE7mKgjGG248nAosou9cw9d9YhXmGBbNFImWMq2
 WEomdGOTMv+WDHxaNuGD7BBOaVK+/CrUV0Wqu8F7qLUUHSR4bQwOtSMM6o+sYJPZuJOG
 J5Jw==
X-Gm-Message-State: APjAAAWbUmZeJekJIcYahj6jTlJeHsYxvrcNMMdmvYQnvR+821sxvsKD
 eDRZjABf6SBye4cRKU7+IARkRuVz4ow=
X-Google-Smtp-Source: APXvYqw42vOmt4ivwKeNQwREfYZCLvOmtdeMD77i4gMq+8ys9F+xRMgvTaMSZbOUM5TP68tX6VSn4A==
X-Received: by 2002:a67:8d08:: with SMTP id p8mr104177vsd.205.1569968489820;
 Tue, 01 Oct 2019 15:21:29 -0700 (PDT)
Received: from julien-desktop.la923.oblong.net (hqfw01-adm.oblong.com.
 [204.154.109.14])
 by smtp.gmail.com with ESMTPSA id 72sm4046436uau.6.2019.10.01.15.21.29
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 15:21:29 -0700 (PDT)
From: Julien Isorce <julien.isorce@gmail.com>
X-Google-Original-From: Julien Isorce <jisorce@oblong.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c to
 hdmi
Date: Tue,  1 Oct 2019 15:21:23 -0700
Message-Id: <20191001222123.2392-1-jisorce@oblong.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=/GxgPAGbX6e7ziJoAFf2TeaerFxc0fyk9xIacgUDW0o=;
 b=hj1GUutZ+LPgZF3okvH1PE+kYLB/DS8FlsiK0yD5UwQopB2YFN+IwAmxRTXekLO5SX
 upu1bg5K7GiCrljWK6Y9ALBZ/sgOxTk2ftJV9w9EcKSTwkmskCeqH3b5QShtMnegIBpR
 bYiYdotmj006+P0viZKOqY/MFuF+MPSmOEwqX1W3ZNiVc3sLBzOlhoF85T6lhA4vl5n4
 R+PkiKdEEC/N16tNoaZ5+NbdHxO4/+Or4zv4XzxdTkpq9u3MSCoBD31yRa0qc3BSxzbV
 4rDsBD2WL7Z74Noi8BfwC036P2NlVBW6xM5WoVRc/sf+TNbGdsBmQ/QUTFGprdxfAfRl
 mQ8g==
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHBpbmtpc2ggY29sb3IgaXNzdWUgYXJvdW5kIGdyZXkgYXJlYXMuIFRoaXMgYWxzbyBoYXBw
ZW5zCndoZW4gbm90IHVzaW5nIGFueSBkb25nbGUgc28gZGlyZWN0bHkgd2l0aCBhIHVzYi1jIHRv
IERpc3BsYXkKUG9ydCBjYWJsZS4gTWVhbmluZyB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2hl
biB1c2luZyBwaXhlbAplbmNvZGluZyBSR0Igd2l0aCBhbWQgZHJpdmVyIGluIHRoZSBnZW5lcmFs
IGNhc2UuIEluIHRoZSBtZWFudGltZQpqdXN0IHVzZSB0aGUgc2FtZSBwaXhlbCBlbmNvZGluZyBh
cyB3aGVuIHVzaW5nIEhETUkgd2l0aG91dCBkb25nbGUuClRoaXMgd2F5IHVzZXJzIHdpbGwgc2Vl
IHRoZSBzYW1lIHRoaW5nIG9uIDIgaWRlbnRpY2FsIHNjcmVlbnMgd2hlbgpvbmUgaXMgY29ubmVj
dGVkIHdpdGggaGRtaS10by1oZG1pIGFuZCB0aGUgb3RoZXIgaXMgY29ubmVjdGVkIHdpdGgKdXNi
LWMtdG8taGRtaS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBJc29yY2UgPGppc29yY2VAb2Jsb25n
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGQz
ZjQwNGYwOTdlYi4uODEzOWRjYzBiZmJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTMzMTMsNiArMzMxMyw3IEBAIHN0YXRp
YyB2b2lkIGZpbGxfc3RyZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKAogewog
CXN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nX291dCA9ICZzdHJlYW0tPnRpbWluZzsKIAlj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlf
aW5mbzsKKwljb25zdCBzdHJ1Y3QgZGNfbGluayAqbGluayA9IHN0cmVhbS0+c2luay0+bGluazsK
IAogCW1lbXNldCh0aW1pbmdfb3V0LCAwLCBzaXplb2Yoc3RydWN0IGRjX2NydGNfdGltaW5nKSk7
CiAKQEAgLTMzMjcsNiArMzMyOCwxMCBAQCBzdGF0aWMgdm9pZCBmaWxsX3N0cmVhbV9wcm9wZXJ0
aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgKIAllbHNlIGlmICgoY29ubmVjdG9yLT5kaXNwbGF5
X2luZm8uY29sb3JfZm9ybWF0cyAmIERSTV9DT0xPUl9GT1JNQVRfWUNSQ0I0NDQpCiAJCQkmJiBz
dHJlYW0tPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9IRE1JX1RZUEVfQSkKIAkJdGltaW5nX291dC0+
cGl4ZWxfZW5jb2RpbmcgPSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQ0NDsKKwllbHNlIGlmICgoY29u
bmVjdG9yLT5kaXNwbGF5X2luZm8uY29sb3JfZm9ybWF0cyAmIERSTV9DT0xPUl9GT1JNQVRfWUNS
Q0I0NDQpCisJCQkmJiBzdHJlYW0tPnNpbmstPnNpbmtfc2lnbmFsID09IFNJR05BTF9UWVBFX0RJ
U1BMQVlfUE9SVAorCQkJJiYgbGluay0+ZHBjZF9jYXBzLmRvbmdsZV90eXBlID09IERJU1BMQVlf
RE9OR0xFX0RQX0hETUlfQ09OVkVSVEVSKQorCQl0aW1pbmdfb3V0LT5waXhlbF9lbmNvZGluZyA9
IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDQ0OwogCWVsc2UKIAkJdGltaW5nX291dC0+cGl4ZWxfZW5j
b2RpbmcgPSBQSVhFTF9FTkNPRElOR19SR0I7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
