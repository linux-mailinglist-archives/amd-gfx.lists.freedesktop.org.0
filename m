Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268F49073
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5746E06D;
	Mon, 17 Jun 2019 19:50:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79FA6E06D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so12348114qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73k0yo3lelXha3iWqfnz4ONPx9YpTo85z0ILssseaFA=;
 b=cvJz8prolnzTPx8h7ljks5SoGqm8Nql1ui3XpFpOu3Ng43302X7NWGziZcjHTUwuqk
 cSbdSl96roS0/exIT6e7nRKmsunw88Rx2+XgDTmgyreh4SUCXPlzVBAOO22s/VHOAONT
 27/PBnsfWyNlS/dXb7tVTozcN93jNIg0FrTcG1spaUzIS9mp2dlSTaT3xYaXfeLOeuxa
 gkaOwhh7RmJkfMtXYaaMi2BtbiOuKLHj4nv/IlXRtxbULbj2XFpmjwrgQ0ueY3mUD5tA
 HHDHFi51ZGngr4k5GgjPEN/a1BPCZ5IkFE+C9jpMN+KvaLF4Ye7KyYxIIRImTC4E1B5K
 b6ew==
X-Gm-Message-State: APjAAAVoFEAPxxtX41I49TAUtpa67lI71miOsS4d9oFBzj1Y2D20BO1j
 GZyeKFDRXEimboQy+7JLfLNEsUPx3qkQgg==
X-Google-Smtp-Source: APXvYqyRg/T83sBpZOuUzY21pUk5lvyTfWC5o7pf5da97z28K4WoEzcIHHMcWnWAm2XIF3zOf7uflA==
X-Received: by 2002:ac8:152:: with SMTP id f18mr91757000qtg.84.1560801038320; 
 Mon, 17 Jun 2019 12:50:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 442/459] drm/amd/display: update DSC MST DP virtual DPCD peer
 device enumeration policy
Date: Mon, 17 Jun 2019 14:49:31 -0500
Message-Id: <20190617194948.18667-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73k0yo3lelXha3iWqfnz4ONPx9YpTo85z0ILssseaFA=;
 b=aRhPNUlAbE9KEZNhJoi2R3N+MjN1vXCwm4gr9UWdf1UIJqIheHo5EjbRLRkAkkue+9
 g1n+X0t9Cem2bSMFUJi/rZaI+7C7UiCOEBygu+JaJ+h6WSKPdSaUoWiDEh0P2agFep6L
 DMa7+5ta9uXyW2/uOVMNZVCJgMbOOGTyksBDCgRlY3oPkOQyqiLcPF25ij4LdkmH003S
 4ZLUR1tXGxgVyt5xd+ah8SdEwF6WbhL4PAHXImeMKaACKfPZFnhRmTfp8Hx4tKwwov6K
 SmYs5Bx4QvWUdpDW2ji+zsoku9fg7jWU7VLXC5Wc0cecMQRBH9XTs2iJr/pvnZ7wCtFg
 esew==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpDdXJyZW50IHBv
bGljeSBhc3N1bWVzIHZpcnR1YWwgRFBDRCBwZWVyIGRldmljZSBhcwphbiBpbmRpdmlkdWFsIE1T
VCBicmFuY2ggZGV2aWNlIHdpdGggMSBpbnB1dCBhbmQgMSBvdXRwdXQuCkhvd2V2ZXIgdGhpcyBp
cyBvbmx5IHRydWUgZm9yIHZpcnR1YWwgRFAtdG8tRFAgcGVlciBkZXZpY2UuCkluIGdlbmVyYWwg
dGhlcmUgYXJlIHRocmVlIHR5cGVzIG9mIHZpcnR1YWwgRFAgcGVlciBkZXZpY2VzLgoxLiBTaW5r
IHBlZXIgZGV2aWNlIHdpdGggdmlydHVhbCBEUENELgoyLiBWaXJ0dWFsIERQLXRvLURQIFBlZXIg
ZGV2aWNlIHdpdGggdmlydHVhbCBEUENELgozLiBWaXJ0dWFsIERQLXRvLUhETUkgUHJvdG9jb2wg
Q29udmVydGVyIFBlZXIgRGV2aWNlIHdpdGgKVmlydHVhbCBEUENELgpTbyB3ZSBzaG91bGQgYnJl
YWsgdGhlIGFzc3VtcHRpb24gYW5kIGhhbmRsZSBhbGwgdGhyZWUgdHlwZXMuCgpbaG93XQpEUC10
by1EUCBwZWVyIGRldmljZSB3aWxsIGhhdmUgdmlydHVhbCBEUENEIGNhcCB1cHN0cmVhbS4KU2lu
ayBwZWVyIGRldmljZSB3aWxsIGhhdmUgdmlydHVhbCBEUENEIG9uIHRoZSBsb2dpY2FsIHBvcnQu
CkRwIHRvIEhETUkgcHJvdG9jb2wgY29udmVydGVyIHBlZXIgZGV2aWNlIHdpbGwgaGF2ZSB2aXJ0
dWFsIERQQ0QKb24gaXRzIGNvbnZlcnRlciBwb3J0LgpGb3IgRFNDIGNhcGFibGUgU3luYXB0aWNz
IG5vbiBWR0EgcG9ydCB3ZSB3b3JrYXJvdW5kIGJ5IGVudW1lcmF0aW5nCmEgdmlydXRhbCBEUENE
IHBlZXIgZGV2aWNlIG9uIGl0cyB1cHN0cmVhbQpldmVuIGlmIGl0IGRvZXNuJ3QgaGF2ZSBvbmUu
CgpTaWduZWQtb2ZmLWJ5OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExh
a2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgIDE0ICsrCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmtfZHAuYyAgfCAgOTUgKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwgIDE5ICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNfZHBfdHlwZXMuaCAgfCAxMTUgKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHNjLmggICAgICAgfCAgIDYgKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYyAgIHwgICA1ICstCiAuLi4vZHJtL2Ft
ZC9kaXNwbGF5L2luY2x1ZGUvZHBjZF9zdHJ1Y3RzLmggICAgfCAxNjggLS0tLS0tLS0tLS0tLS0t
LS0tCiA3IGZpbGVzIGNoYW5nZWQsIDE2MSBpbnNlcnRpb25zKCspLCAyNjEgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUv
ZHBjZF9zdHJ1Y3RzLmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwppbmRleCA4ZjIwNmE3ZGRiOGMuLjBiZTYzNjNjNjZlNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBA
IC0zNDk0LDYgKzM0OTQsMjAgQEAgY3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1Y3QgYW1kZ3B1
X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciwKIAkJZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9t
X2RybV9kaXNwbGF5X21vZGUoc3RyZWFtLAogCQkJJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBj
b25fc3RhdGUsIG9sZF9zdHJlYW0pOwogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NV
UFBPUlQKKwkvKiBzdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgPSAwOyAqLworICAgICAgICAvKiAg
Ki8KKwkvKiBpZiAoYWNvbm5lY3Rvci0+ZGNfbGluayAmJiAqLworCS8qIAkJYWNvbm5lY3Rvci0+
ZGNfbGluay0+Y29ubmVjdG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQgIzx7
KHwmJiAqLworCS8qIAkJYWNvbm5lY3Rvci0+ZGNfbGluay0+ZHBjZF9jYXBzLmRzY19jYXBzLmRz
Y19iYXNpY19jYXBzLmlzX2RzY19zdXBwb3J0ZWR8KX0+IykgKi8KKwkvKiAJaWYgKGRjX2RzY19j
b21wdXRlX2NvbmZpZyhhY29ubmVjdG9yLT5kY19saW5rLT5jdHgtPmRjLCAqLworCS8qIAkJCSZh
Y29ubmVjdG9yLT5kY19saW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMsICovCisJLyogCQkJZGNfbGlu
a19iYW5kd2lkdGhfa2JwcyhhY29ubmVjdG9yLT5kY19saW5rLCBkY19saW5rX2dldF9saW5rX2Nh
cChhY29ubmVjdG9yLT5kY19saW5rKSksICovCisJLyogCQkJJnN0cmVhbS0+dGltaW5nLCAqLwor
CS8qIAkJCSZzdHJlYW0tPnRpbWluZy5kc2NfY2ZnKSkgKi8KKwkvKiAJCXN0cmVhbS0+dGltaW5n
LmZsYWdzLkRTQyA9IDE7ICovCisjZW5kaWYKKwogCXVwZGF0ZV9zdHJlYW1fc2NhbGluZ19zZXR0
aW5ncygmbW9kZSwgZG1fc3RhdGUsIHN0cmVhbSk7CiAKIAlmaWxsX2F1ZGlvX2luZm8oCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKaW5kZXgg
MDE3Zjg4YzlmMmU0Li4wNTZiZTRjMzRhOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKQEAgLTIzODIsMTAgKzIzODIsNiBAQCBzdGF0
aWMgYm9vbCByZXRyaWV2ZV9saW5rX2NhcChzdHJ1Y3QgZGNfbGluayAqbGluaykKIAl1aW50MzJf
dCByZWFkX2RwY2RfcmV0cnlfY250ID0gMzsKIAlpbnQgaTsKIAlzdHJ1Y3QgZHBfc2lua19od19m
d19yZXZpc2lvbiBkcF9od19md19yZXZpc2lvbjsKLSNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19E
U0NfU1VQUE9SVAotCXVpbnQ4X3QgZHNjX2RhdGFbMTZdOyAvKiBEUF9EU0NfQklUU19QRVJfUElY
RUxfSU5DIC0gRFBfRFNDX1NVUFBPUlQgKyAxID09IDE2ICovCi0Jc3RydWN0IGRzY19kZWNfZHBj
ZF9jYXBzICpkc2NfZGVjX2NhcHM7Ci0jZW5kaWYKIAogCW1lbXNldChkcGNkX2RhdGEsICdcMCcs
IHNpemVvZihkcGNkX2RhdGEpKTsKIAltZW1zZXQoJmRvd25fc3RybV9wb3J0X2NvdW50LApAQCAt
MjU1OCw5MyArMjU1NCwyNiBAQCBzdGF0aWMgYm9vbCByZXRyaWV2ZV9saW5rX2NhcChzdHJ1Y3Qg
ZGNfbGluayAqbGluaykKIAkJc2l6ZW9mKGRwX2h3X2Z3X3JldmlzaW9uLmllZWVfZndfcmV2KSk7
CiAKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAotCWRzY19kZWNfY2FwcyA9
ICZsaW5rLT5kcGNkX2NhcHMuZHNjX3NpbmtfY2FwczsKLQltZW1zZXQoZHNjX2RlY19jYXBzLCAn
XDAnLCBzaXplb2YoKmRzY19kZWNfY2FwcykpOwotCW1lbXNldCgmbGluay0+ZHBjZF9jYXBzLmRz
Y19zaW5rX2NhcHMsICdcMCcsCi0JCQlzaXplb2YobGluay0+ZHBjZF9jYXBzLmRzY19zaW5rX2Nh
cHMpKTsKKwltZW1zZXQoJmxpbmstPmRwY2RfY2Fwcy5kc2NfY2FwcywgJ1wwJywKKwkJCXNpemVv
ZihsaW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMpKTsKIAltZW1zZXQoJmxpbmstPmRwY2RfY2Fwcy5m
ZWNfY2FwLCAnXDAnLCBzaXplb2YobGluay0+ZHBjZF9jYXBzLmZlY19jYXApKTsKIAkvKiBSZWFk
IERTQyBhbmQgRkVDIHNpbmsgY2FwYWJpbGl0aWVzIGlmIERQIHJldmlzaW9uIGlzIDEuNCBhbmQg
dXAgKi8KIAlpZiAobGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2LnJhdyA+PSBEUENEX1JFVl8xNCkg
ewotCQlzdGF0dXMgPSBjb3JlX2xpbmtfcmVhZF9kcGNkKAotCQkJCWxpbmssCi0JCQkJRFBfRFND
X1NVUFBPUlQsCi0JCQkJZHNjX2RhdGEsCi0JCQkJc2l6ZW9mKGRzY19kYXRhKSk7Ci0JCWlmIChz
dGF0dXMgPT0gRENfT0spIHsKLQkJCURDX0xPR19EU0MoIkRTQyBEUENEIGNhcGFiaWxpdHkgcmVh
ZCBhdCBsaW5rICVkOiIsCi0JCQkJCWxpbmstPmxpbmtfaW5kZXgpOwotCQkJRENfTE9HX0RTQygi
XHQlMDJ4ICUwMnggJTAyeCAlMDJ4IiwKLQkJCQkJZHNjX2RhdGFbMF0sIGRzY19kYXRhWzFdLAot
CQkJCQlkc2NfZGF0YVsyXSwgZHNjX2RhdGFbM10pOwotCQkJRENfTE9HX0RTQygiXHQlMDJ4ICUw
MnggJTAyeCAlMDJ4IiwKLQkJCQkJZHNjX2RhdGFbNF0sIGRzY19kYXRhWzVdLAotCQkJCQlkc2Nf
ZGF0YVs2XSwgZHNjX2RhdGFbN10pOwotCQkJRENfTE9HX0RTQygiXHQlMDJ4ICUwMnggJTAyeCAl
MDJ4IiwKLQkJCQkJZHNjX2RhdGFbOF0sIGRzY19kYXRhWzldLAotCQkJCQlkc2NfZGF0YVsxMF0s
IGRzY19kYXRhWzExXSk7Ci0JCQlEQ19MT0dfRFNDKCJcdCUwMnggJTAyeCAlMDJ4ICUwMngiLAot
CQkJCQlkc2NfZGF0YVsxMl0sIGRzY19kYXRhWzEzXSwKLQkJCQkJZHNjX2RhdGFbMTRdLCBkc2Nf
ZGF0YVsxNV0pOwotCQl9IGVsc2UgewotCQkJZG1fZXJyb3IoIiVzOiBSZWFkIERTQyBkcGNkIGRh
dGEgZmFpbGVkLlxuIiwgX19mdW5jX18pOwotCQkJcmV0dXJuIGZhbHNlOwotCQl9Ci0KLQkJaWYg
KGRjX2RzY19wYXJzZV9kc2NfZHBjZChkc2NfZGF0YSwgTlVMTCwKLQkJCQlkc2NfZGVjX2NhcHMp
KSB7Ci0JCQlEQ19MT0dfRFNDKCJEU0MgRFBDRCBjYXBhYmlsaXRpZXMgcGFyc2VkIGF0IGxpbmsg
JWQ6IiwKLQkJCQkJbGluay0+bGlua19pbmRleCk7Ci0JCQlEQ19MT0dfRFNDKCJcdGlzX2RzY19z
dXBwb3J0ZWQ6XHQlZCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+aXNfZHNjX3N1cHBvcnRlZCk7Ci0J
CQlEQ19MT0dfRFNDKCJcdGRzY192ZXJzaW9uOlx0JWQiLCBkc2NfZGVjX2NhcHMtPmRzY192ZXJz
aW9uKTsKLQkJCURDX0xPR19EU0MoIlx0cmNfYnVmZmVyX3NpemU6XHQlZCIsCi0JCQkJCWRzY19k
ZWNfY2Fwcy0+cmNfYnVmZmVyX3NpemUpOwotCQkJRENfTE9HX0RTQygiXHRzbGljZV9jYXBzMTpc
dDB4JXgyMCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+c2xpY2VfY2FwczEucmF3KTsKLQkJCURDX0xP
R19EU0MoIlx0c2xpY2VfY2FwczI6XHQweCV4MjAiLAotCQkJCQlkc2NfZGVjX2NhcHMtPnNsaWNl
X2NhcHMyLnJhdyk7Ci0JCQlEQ19MT0dfRFNDKCJcdGxiX2JpdF9kZXB0aDpcdCVkIiwKLQkJCQkJ
ZHNjX2RlY19jYXBzLT5sYl9iaXRfZGVwdGgpOwotCQkJRENfTE9HX0RTQygiXHRpc19ibG9ja19w
cmVkX3N1cHBvcnRlZDpcdCVkIiwKLQkJCQkJZHNjX2RlY19jYXBzLT5pc19ibG9ja19wcmVkX3N1
cHBvcnRlZCk7Ci0JCQlEQ19MT0dfRFNDKCJcdGVkcF9tYXhfYml0c19wZXJfcGl4ZWw6XHQlZCIs
Ci0JCQkJCWRzY19kZWNfY2Fwcy0+ZWRwX21heF9iaXRzX3Blcl9waXhlbCk7Ci0JCQlEQ19MT0df
RFNDKCJcdGNvbG9yX2Zvcm1hdHM6XHQlZCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+Y29sb3JfZm9y
bWF0cy5yYXcpOwotCQkJRENfTE9HX0RTQygiXHRjb2xvcl9kZXB0aDpcdCVkIiwKLQkJCQkJZHNj
X2RlY19jYXBzLT5jb2xvcl9kZXB0aC5yYXcpOwotCQkJRENfTE9HX0RTQygiXHR0aHJvdWdocHV0
X21vZGVfMF9tcHM6XHQlZCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+dGhyb3VnaHB1dF9tb2RlXzBf
bXBzKTsKLQkJCURDX0xPR19EU0MoIlx0dGhyb3VnaHB1dF9tb2RlXzFfbXBzOlx0JWQiLAotCQkJ
CQlkc2NfZGVjX2NhcHMtPnRocm91Z2hwdXRfbW9kZV8xX21wcyk7Ci0JCQlEQ19MT0dfRFNDKCJc
dG1heF9zbGljZV93aWR0aDpcdCVkIiwKLQkJCQkJZHNjX2RlY19jYXBzLT5tYXhfc2xpY2Vfd2lk
dGgpOwotCQkJRENfTE9HX0RTQygiXHRicHBfaW5jcmVtZW50X2RpdjpcdCVkIiwKLQkJCQkJZHNj
X2RlY19jYXBzLT5icHBfaW5jcmVtZW50X2Rpdik7Ci0JCQlEQ19MT0dfRFNDKCJcdGJyYW5jaF9v
dmVyYWxsX3Rocm91Z2hwdXRfMF9tcHM6XHQlZCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+YnJhbmNo
X292ZXJhbGxfdGhyb3VnaHB1dF8wX21wcyk7Ci0JCQlEQ19MT0dfRFNDKCJcdGJyYW5jaF9vdmVy
YWxsX3Rocm91Z2hwdXRfMV9tcHM6XHQlZCIsCi0JCQkJCWRzY19kZWNfY2Fwcy0+YnJhbmNoX292
ZXJhbGxfdGhyb3VnaHB1dF8xX21wcyk7Ci0JCQlEQ19MT0dfRFNDKCJcdGJyYW5jaF9tYXhfbGlu
ZV93aWR0aDpcdCVkIiwKLQkJCQkJZHNjX2RlY19jYXBzLT5icmFuY2hfbWF4X2xpbmVfd2lkdGgp
OwotCQl9IGVsc2UgewotCQkJLyogU29tZSBzaW5rcyByZXR1cm4gYm9ndXMgRFNDIERQQ0QgZGF0
YQotCQkJICogd2hlbiB0aGV5IGRvbid0IHN1cHBvcnQgRFNDLgotCQkJICovCi0JCQlkbV9lcnJv
cigiJXM6IERTQyBEUENEIGRhdGEgZG9lc24ndCBtYWtlIHNlbnNlLiAiCi0JCQkJCSJEU0Mgd2ls
bCBiZSBkaXNhYmxlZC5cbiIsIF9fZnVuY19fKTsKLQkJCW1lbXNldCgmbGluay0+ZHBjZF9jYXBz
LmRzY19zaW5rX2NhcHMsICdcMCcsCi0JCQkJCXNpemVvZihsaW5rLT5kcGNkX2NhcHMuZHNjX3Np
bmtfY2FwcykpOwotCQl9Ci0KIAkJc3RhdHVzID0gY29yZV9saW5rX3JlYWRfZHBjZCgKIAkJCQls
aW5rLAogCQkJCURQX0ZFQ19DQVBBQklMSVRZLAogCQkJCSZsaW5rLT5kcGNkX2NhcHMuZmVjX2Nh
cC5yYXcsCiAJCQkJc2l6ZW9mKGxpbmstPmRwY2RfY2Fwcy5mZWNfY2FwLnJhdykpOwotCQlpZiAo
c3RhdHVzICE9IERDX09LKQotCQkJZG1fZXJyb3IoIiVzOiBSZWFkIEZFQyBkcGNkIHJlZ2lzdGVy
IGZhaWxlZC5cbiIsCi0JCQkJCV9fZnVuY19fKTsKKwkJc3RhdHVzID0gY29yZV9saW5rX3JlYWRf
ZHBjZCgKKwkJCQlsaW5rLAorCQkJCURQX0RTQ19TVVBQT1JULAorCQkJCWxpbmstPmRwY2RfY2Fw
cy5kc2NfY2Fwcy5kc2NfYmFzaWNfY2Fwcy5yYXcsCisJCQkJc2l6ZW9mKGxpbmstPmRwY2RfY2Fw
cy5kc2NfY2Fwcy5kc2NfYmFzaWNfY2Fwcy5yYXcpKTsKKwkJc3RhdHVzID0gY29yZV9saW5rX3Jl
YWRfZHBjZCgKKwkJCQlsaW5rLAorCQkJCURQX0RTQ19CUkFOQ0hfT1ZFUkFMTF9USFJPVUdIUFVU
XzAsCisJCQkJbGluay0+ZHBjZF9jYXBzLmRzY19jYXBzLmRzY19leHRfY2Fwcy5yYXcsCisJCQkJ
c2l6ZW9mKGxpbmstPmRwY2RfY2Fwcy5kc2NfY2Fwcy5kc2NfZXh0X2NhcHMucmF3KSk7CiAJfQog
I2VuZGlmCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggODBjMTE4ZjBkNmRh
Li4yNTJlYmEyZWUxMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC05MTAs
OCArOTEwLDggQEAgc3RydWN0IGRwY2RfY2FwcyB7CiAJYm9vbCBkcGNkX2Rpc3BsYXlfY29udHJv
bF9jYXBhYmxlOwogCWJvb2wgZXh0X3JlY2VpdmVyX2NhcF9maWVsZF9wcmVzZW50OwogI2lmZGVm
IENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCi0JdW5pb24gZmVjX2NhcGFiaWxpdHkgZmVj
X2NhcDsKLQlzdHJ1Y3QgZHNjX2RlY19kcGNkX2NhcHMgZHNjX3NpbmtfY2FwczsKKwl1bmlvbiBk
cGNkX2ZlY19jYXBhYmlsaXR5IGZlY19jYXA7CisJc3RydWN0IGRwY2RfZHNjX2NhcGFiaWxpdGll
cyBkc2NfY2FwczsKICNlbmRpZgogfTsKIApAQCAtOTMzLDYgKzkzMywxNCBAQCBzdHJ1Y3QgZGNf
Y29udGFpbmVyX2lkIHsKIH07CiAKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQ
T1JUCitzdHJ1Y3QgZGNfc2lua19kc2NfY2FwcyB7CisJLy8gJ3RydWUnIGlmIHRoZXNlIGFyZSB2
aXJ0dWFsIERQQ0QncyBEU0MgY2FwcyAoaW1tZWRpYXRlbHkgdXBzdHJlYW0gb2Ygc2luayBpbiBN
U1QgdG9wb2xvZ3kpLAorCS8vICdmYWxzZScgaWYgdGhleSBhcmUgc2luaydzIERTQyBjYXBzCisJ
Ym9vbCBpc192aXJ0dWFsX2RwY2RfZHNjOworCXN0cnVjdCBkc2NfZGVjX2RwY2RfY2FwcyBkc2Nf
ZGVjX2NhcHM7Cit9OworI2VuZGlmCiAKIC8qCiAgKiBUaGUgc2luayBzdHJ1Y3R1cmUgY29udGFp
bnMgRURJRCBhbmQgb3RoZXIgZGlzcGxheSBkZXZpY2UgcHJvcGVydGllcwpAQCAtOTQ4LDEyICs5
NTYsNyBAQCBzdHJ1Y3QgZGNfc2luayB7CiAJYm9vbCBjb252ZXJ0ZXJfZGlzYWJsZV9hdWRpbzsK
IAogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCi0Jc3RydWN0IGRjX3Npbmtf
ZHNjX2NhcHMgewotCQkvLyAndHJ1ZScgaWYgdGhlc2UgYXJlIHZpcnR1YWwgRFBDRCdzIERTQyBj
YXBzIChpbW1lZGlhdGVseSB1cHN0cmVhbSBvZiBzaW5rIGluIE1TVCB0b3BvbG9neSksCi0JCS8v
ICdmYWxzZScgaWYgdGhleSBhcmUgc2luaydzIERTQyBjYXBzCi0JCWJvb2wgaXNfdmlydHVhbF9k
cGNkX2RzYzsKLQkJc3RydWN0IGRzY19kZWNfZHBjZF9jYXBzIGRzY19kZWNfY2FwczsKLQl9IHNp
bmtfZHNjX2NhcHM7CisJc3RydWN0IGRjX3NpbmtfZHNjX2NhcHMgc2lua19kc2NfY2FwczsKICNl
bmRpZgogCiAJLyogcHJpdmF0ZSB0byBEQyBjb3JlICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHBfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY19kcF90eXBlcy5oCmluZGV4IDY4OTJiZjgwYzllMC4uZGZjZWM0ZDNlOWMw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHBfdHlwZXMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHBfdHlwZXMuaApAQCAt
NTE0LDcgKzUxNCw3IEBAIHVuaW9uIHRlc3RfbWlzYyB7CiAKICNpZmRlZiBDT05GSUdfRFJNX0FN
RF9EQ19EU0NfU1VQUE9SVAogLyogRkVDIGNhcGFiaWxpdHkgRFBDRCByZWdpc3RlciBmaWVsZCBi
aXRzLSovCi11bmlvbiBmZWNfY2FwYWJpbGl0eSB7Cit1bmlvbiBkcGNkX2ZlY19jYXBhYmlsaXR5
IHsKIAlzdHJ1Y3QgewogCQl1aW50OF90IEZFQ19DQVBBQkxFOjE7CiAJCXVpbnQ4X3QgVU5DT1JS
RUNURURfQkxPQ0tfRVJST1JfQ09VTlRfQ0FQQUJMRToxOwpAQCAtNTI0LDYgKzUyNCwxMTkgQEAg
dW5pb24gZmVjX2NhcGFiaWxpdHkgewogCX0gYml0czsKIAl1aW50OF90IHJhdzsKIH07CisKKy8q
IERTQyBjYXBhYmlsaXR5IERQQ0QgcmVnaXN0ZXIgZmllbGQgYml0cy0qLworc3RydWN0IGRwY2Rf
ZHNjX3N1cHBvcnQgeworCXVpbnQ4X3QgRFNDX1NVUFBPUlQJCToxOworCXVpbnQ4X3QgRFNDX1BB
U1NUSFJPVUdIX1NVUFBPUlQJOjE7CisJdWludDhfdCBSRVNFUlZFRAkJOjY7Cit9OworCitzdHJ1
Y3QgZHBjZF9kc2NfYWxnb3JpdGhtX3JldmlzaW9uIHsKKwl1aW50OF90IERTQ19WRVJTSU9OX01B
Sk9SCTo0OworCXVpbnQ4X3QgRFNDX1ZFUlNJT05fTUlOT1IJOjQ7Cit9OworCitzdHJ1Y3QgZHBj
ZF9kc2NfcmNfYnVmZmVyX2Jsb2NrX3NpemUgeworCXVpbnQ4X3QgUkNfQkxPQ0tfQlVGRkVSX1NJ
WkUJOjI7CisJdWludDhfdCBSRVNFUlZFRAkJOjY7Cit9OworCitzdHJ1Y3QgZHBjZF9kc2Nfc2xp
Y2VfY2FwYWJpbGl0eTEgeworCXVpbnQ4X3QgT05FX1NMSUNFX1BFUl9EUF9EU0NfU0lOS19ERVZJ
Q0UJOjE7CisJdWludDhfdCBUV09fU0xJQ0VTX1BFUl9EUF9EU0NfU0lOS19ERVZJQ0UJOjE7CisJ
dWludDhfdCBSRVNFUlZFRAkJCQk6MTsKKwl1aW50OF90IEZPVVJfU0xJQ0VTX1BFUl9EUF9EU0Nf
U0lOS19ERVZJQ0UJOjE7CisJdWludDhfdCBTSVhfU0xJQ0VTX1BFUl9EUF9EU0NfU0lOS19ERVZJ
Q0UJOjE7CisJdWludDhfdCBFSUdIVF9TTElDRVNfUEVSX0RQX0RTQ19TSU5LX0RFVklDRQk6MTsK
Kwl1aW50OF90IFRFTl9TTElDRVNfUEVSX0RQX0RTQ19TSU5LX0RFVklDRQk6MTsKKwl1aW50OF90
IFRXRUxWRV9TTElDRVNfUEVSX0RQX0RTQ19TSU5LX0RFVklDRQk6MTsKK307CisKK3N0cnVjdCBk
cGNkX2RzY19saW5lX2J1ZmZlcl9iaXRfZGVwdGggeworCXVpbnQ4X3QgTElORV9CVUZGRVJfQklU
X0RFUFRICTo0OworCXVpbnQ4X3QgUkVTRVJWRUQJCTo0OworfTsKKworc3RydWN0IGRwY2RfZHNj
X2Jsb2NrX3ByZWRpY3Rpb25fc3VwcG9ydCB7CisJdWludDhfdCBCTE9DS19QUkVESUNUSU9OX1NV
UFBPUlQ6MTsKKwl1aW50OF90IFJFU0VSVkVECQk6NzsKK307CisKK3N0cnVjdCBkcGNkX21heGlt
dW1fYml0c19wZXJfcGl4ZWxfc3VwcG9ydGVkX2J5X3RoZV9kZWNvbXByZXNzb3IgeworCXVpbnQ4
X3QgTUFYSU1VTV9CSVRTX1BFUl9QSVhFTF9TVVBQT1JURURfQllfVEhFX0RFQ09NUFJFU1NPUl9M
T1cJOjc7CisJdWludDhfdCBNQVhJTVVNX0JJVFNfUEVSX1BJWEVMX1NVUFBPUlRFRF9CWV9USEVf
REVDT01QUkVTU09SX0hJR0gJOjc7CisJdWludDhfdCBSRVNFUlZFRAkJCQkJCQk6MjsKK307CisK
K3N0cnVjdCBkcGNkX2RzY19kZWNvZGVyX2NvbG9yX2Zvcm1hdF9jYXBhYmlsaXRpZXMgeworCXVp
bnQ4X3QgUkdCX1NVUFBPUlQJCQk6MTsKKwl1aW50OF90IFlfQ0JfQ1JfNDQ0X1NVUFBPUlQJCTox
OworCXVpbnQ4X3QgWV9DQl9DUl9TSU1QTEVfNDIyX1NVUFBPUlQJOjE7CisJdWludDhfdCBZX0NC
X0NSX05BVElWRV80MjJfU1VQUE9SVAk6MTsKKwl1aW50OF90IFlfQ0JfQ1JfTkFUSVZFXzQyMF9T
VVBQT1JUCToxOworCXVpbnQ4X3QgUkVTRVJWRUQJCQk6MzsKK307CisKK3N0cnVjdCBkcGNkX2Rz
Y19kZWNvZGVyX2NvbG9yX2RlcHRoX2NhcGFiaWxpdGllcyB7CisJdWludDhfdCBSRVNFUlZFRDAJ
CQk6MTsKKwl1aW50OF90IEVJR0hUX0JJVFNfUEVSX0NPTE9SX1NVUFBPUlQJOjE7CisJdWludDhf
dCBURU5fQklUU19QRVJfQ09MT1JfU1VQUE9SVAk6MTsKKwl1aW50OF90IFRXRUxWRV9CSVRTX1BF
Ul9DT0xPUl9TVVBQT1JUCToxOworCXVpbnQ4X3QgUkVTRVJWRUQxCQkJOjQ7Cit9OworCitzdHJ1
Y3QgZHBjZF9wZWFrX2RzY190aHJvdWdocHV0X2RzY19zaW5rIHsKKwl1aW50OF90IFRIUk9VR0hQ
VVRfTU9ERV8wOjQ7CisJdWludDhfdCBUSFJPVUdIUFVUX01PREVfMTo0OworfTsKKworc3RydWN0
IGRwY2RfZHNjX3NsaWNlX2NhcGFiaWxpdGllc18yIHsKKwl1aW50OF90IFNJWFRFRU5fU0xJQ0VT
X1BFUl9EU0NfU0lOS19ERVZJQ0UJOjE7CisJdWludDhfdCBUV0VOVFlfU0xJQ0VTX1BFUl9EU0Nf
U0lOS19ERVZJQ0UJOjE7CisJdWludDhfdCBUV0VOVFlGT1VSX1NMSUNFU19QRVJfRFNDX1NJTktf
REVWSUNFCToxOworCXVpbnQ4X3QgUkVTRVJWRUQJCQkJOjU7Cit9OworCitzdHJ1Y3QgZHBjZF9i
aXRzX3Blcl9waXhlbF9pbmNyZW1lbnR7CisJdWludDhfdCBJTkNSRU1FTlRfT0ZfQklUU19QRVJf
UElYRUxfU1VQUE9SVEVECTozOworCXVpbnQ4X3QgUkVTRVJWRUQJCQkJOjU7Cit9OwordW5pb24g
ZHBjZF9kc2NfYmFzaWNfY2FwYWJpbGl0aWVzIHsKKwlzdHJ1Y3QgeworCQlzdHJ1Y3QgZHBjZF9k
c2Nfc3VwcG9ydCBkc2Nfc3VwcG9ydDsKKwkJc3RydWN0IGRwY2RfZHNjX2FsZ29yaXRobV9yZXZp
c2lvbiBkc2NfYWxnb3JpdGhtX3JldmlzaW9uOworCQlzdHJ1Y3QgZHBjZF9kc2NfcmNfYnVmZmVy
X2Jsb2NrX3NpemUgZHNjX3JjX2J1ZmZlcl9ibG9ja19zaXplOworCQl1aW50OF90IGRzY19yY19i
dWZmZXJfc2l6ZTsKKwkJc3RydWN0IGRwY2RfZHNjX3NsaWNlX2NhcGFiaWxpdHkxIGRzY19zbGlj
ZV9jYXBhYmlsaXRpZXNfMTsKKwkJc3RydWN0IGRwY2RfZHNjX2xpbmVfYnVmZmVyX2JpdF9kZXB0
aCBkc2NfbGluZV9idWZmZXJfYml0X2RlcHRoOworCQlzdHJ1Y3QgZHBjZF9kc2NfYmxvY2tfcHJl
ZGljdGlvbl9zdXBwb3J0IGRzY19ibG9ja19wcmVkaWN0aW9uX3N1cHBvcnQ7CisJCXN0cnVjdCBk
cGNkX21heGltdW1fYml0c19wZXJfcGl4ZWxfc3VwcG9ydGVkX2J5X3RoZV9kZWNvbXByZXNzb3Ig
bWF4aW11bV9iaXRzX3Blcl9waXhlbF9zdXBwb3J0ZWRfYnlfdGhlX2RlY29tcHJlc3NvcjsKKwkJ
c3RydWN0IGRwY2RfZHNjX2RlY29kZXJfY29sb3JfZm9ybWF0X2NhcGFiaWxpdGllcyBkc2NfZGVj
b2Rlcl9jb2xvcl9mb3JtYXRfY2FwYWJpbGl0aWVzOworCQlzdHJ1Y3QgZHBjZF9kc2NfZGVjb2Rl
cl9jb2xvcl9kZXB0aF9jYXBhYmlsaXRpZXMgZHNjX2RlY29kZXJfY29sb3JfZGVwdGhfY2FwYWJp
bGl0aWVzOworCQlzdHJ1Y3QgZHBjZF9wZWFrX2RzY190aHJvdWdocHV0X2RzY19zaW5rIHBlYWtf
ZHNjX3Rocm91Z2hwdXRfZHNjX3Npbms7CisJCXVpbnQ4X3QgZHNjX21heGltdW1fc2xpY2Vfd2lk
dGg7CisJCXN0cnVjdCBkcGNkX2RzY19zbGljZV9jYXBhYmlsaXRpZXNfMiBkc2Nfc2xpY2VfY2Fw
YWJpbGl0aWVzXzI7CisJCXVpbnQ4X3QgcmVzZXJ2ZWQ7CisJCXN0cnVjdCBkcGNkX2JpdHNfcGVy
X3BpeGVsX2luY3JlbWVudCBiaXRzX3Blcl9waXhlbF9pbmNyZW1lbnQ7CisJfSBmaWVsZHM7CisJ
dWludDhfdCByYXdbMTZdOworfTsKKwordW5pb24gZHBjZF9kc2NfZXh0X2NhcGFiaWxpdGllcyB7
CisJc3RydWN0IHsKKwkJdWludDhfdCBCUkFOQ0hfT1ZFUkFMTF9USFJPVUdIUFVUXzA7CisJCXVp
bnQ4X3QgQlJBTkNIX09WRVJBTExfVEhST1VHSFBVVF8xOworCQl1aW50OF90IEJSQU5DSF9NQVhf
TElORV9XSURUSDsKKwl9IGZpZWxkczsKKwl1aW50OF90IHJhd1szXTsKK307CisKK3N0cnVjdCBk
cGNkX2RzY19jYXBhYmlsaXRpZXMgeworCXVuaW9uIGRwY2RfZHNjX2Jhc2ljX2NhcGFiaWxpdGll
cyBkc2NfYmFzaWNfY2FwczsKKwl1bmlvbiBkcGNkX2RzY19leHRfY2FwYWJpbGl0aWVzIGRzY19l
eHRfY2FwczsKK307CisKICNlbmRpZiAvKiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCAq
LwogCiAjZW5kaWYgLyogRENfRFBfVFlQRVNfSCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RzYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjX2RzYy5oCmluZGV4IDZkZTNiYzkxNjJlYS4uNmU0MjIwOWYwZTIwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHNjLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RzYy5oCkBAIC0yNSw2ICsyNSwxMiBAQAogICogQXV0
aG9yOiBBTUQKICAqLwogCisvKiBwdXQgaXQgaGVyZSB0ZW1wb3JhcmlseSB1bnRpbCBsaW51eCBo
YXMgdGhlIG5ldyBhZGRyZXNzZXMgb2ZmaWNpYWwgZGVmaW5lZCAqLworLyogRFAgRXh0ZW5kZWQg
RFNDIENhcGFiaWxpdGllcyAqLworI2RlZmluZSBEUF9EU0NfQlJBTkNIX09WRVJBTExfVEhST1VH
SFBVVF8wICAweDBhMCAgIC8qIERQIDEuNGEgU0NSICovCisjZGVmaW5lIERQX0RTQ19CUkFOQ0hf
T1ZFUkFMTF9USFJPVUdIUFVUXzEgIDB4MGExCisjZGVmaW5lIERQX0RTQ19CUkFOQ0hfTUFYX0xJ
TkVfV0lEVEggICAgICAgIDB4MGEyCisKIHN0cnVjdCBkY19kc2NfYndfcmFuZ2UgewogCXVpbnQz
Ml90IG1pbl9rYnBzOyAvKiBCYW5kd2lkdGggaWYgbWluX3RhcmdldF9icHBfeDE2IGlzIHVzZWQg
Ki8KIAl1aW50MzJfdCBtaW5fdGFyZ2V0X2JwcF94MTY7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RzYy9kY19kc2MuYwppbmRleCAyNTJjM2QwYTI1NTUuLjk2YjE4YmIzYjFjYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCkBAIC03MjUs
OSArNzI1LDEyIEBAIHN0YXRpYyBib29sIHNldHVwX2RzY19jb25maWcoCiAKIGJvb2wgZGNfZHNj
X3BhcnNlX2RzY19kcGNkKGNvbnN0IHVpbnQ4X3QgKmRwY2RfZHNjX2Jhc2ljX2RhdGEsIGNvbnN0
IHVpbnQ4X3QgKmRwY2RfZHNjX2V4dF9kYXRhLCBzdHJ1Y3QgZHNjX2RlY19kcGNkX2NhcHMgKmRz
Y19zaW5rX2NhcHMpCiB7CisJaWYgKCFkcGNkX2RzY19iYXNpY19kYXRhKQorCQlyZXR1cm4gZmFs
c2U7CisKIAlkc2Nfc2lua19jYXBzLT5pc19kc2Nfc3VwcG9ydGVkID0gKGRwY2RfZHNjX2Jhc2lj
X2RhdGFbRFBfRFNDX1NVUFBPUlQgLSBEUF9EU0NfU1VQUE9SVF0gJiBEUF9EU0NfREVDT01QUkVT
U0lPTl9JU19TVVBQT1JURUQpICE9IDA7CiAJaWYgKCFkc2Nfc2lua19jYXBzLT5pc19kc2Nfc3Vw
cG9ydGVkKQotCQlyZXR1cm4gdHJ1ZTsKKwkJcmV0dXJuIGZhbHNlOwogCiAJZHNjX3NpbmtfY2Fw
cy0+ZHNjX3ZlcnNpb24gPSBkcGNkX2RzY19iYXNpY19kYXRhW0RQX0RTQ19SRVYgLSBEUF9EU0Nf
U1VQUE9SVF07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNs
dWRlL2RwY2Rfc3RydWN0cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUv
ZHBjZF9zdHJ1Y3RzLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGNhOWM1ZTBjMDYy
Zi4uMDAwMDAwMDAwMDAwCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRl
L2RwY2Rfc3RydWN0cy5oCisrKyAvZGV2L251bGwKQEAgLTEsMTY4ICswLDAgQEAKLS8qCi0gKiBk
cGNkX3N0cnVjdHMuaAotICoKLSAqICBDcmVhdGVkIG9uOiBPY3QgMzEsIDIwMTgKLSAqICAgICAg
QXV0aG9yOiBqbGVpCi0gKi8KLQotI2lmbmRlZiBEQUxfSU5DTFVERV9EUENEX1NUUlVDVFNfSF8K
LSNkZWZpbmUgREFMX0lOQ0xVREVfRFBDRF9TVFJVQ1RTX0hfCi0KLXN0cnVjdCBkcGNkX3JlY2Vp
dmVfcG9ydDBfY2FwMDEgewotCXVuaW9uIHsKLQkJc3RydWN0IHsKLQkJCS8vIEJ5dGUgMAotCQkJ
dW5zaWduZWQgY2hhciByZXNlcnZlZDAJCQkJOjE7IC8vIEJpdDAKLQkJCXVuc2lnbmVkIGNoYXIg
bG9jYWxfZWRpZF9wcmVzZW50CQk6MTsKLQkJCXVuc2lnbmVkIGNoYXIgYXNzb2NpYXRlZF90b19w
cmVjZWRpbmdfcG9ydAk6MTsKLQkJCXVuc2lnbmVkIGNoYXIgaGJsYW5rX2V4cGFuc2lvbl9jYXBh
YmxlCQk6MTsKLQkJCXVuc2lnbmVkIGNoYXIgYnVmZmVyX3NpemVfdW5pdAkJCToxOyAvLyBCaXQ0
Ci0JCQl1bnNpZ25lZCBjaGFyIGJ1ZmZlcl9zaXplX3Blcl9wb3J0CQk6MTsKLQkJCXVuc2lnbmVk
IGNoYXIgcmVzZXJ2ZWQxCQkJCToyOwotCi0JCQkvLyBCeXRlIDEKLQkJCXVuc2lnbmVkIGNoYXIg
YnVmZmVyX3NpemUJCQk6ODsKLQkJfSBmaWVsZHM7Ci0JCXVuc2lnbmVkIGNoYXIgcmF3WzJdOwot
CX07Ci19OwotCi0jaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKLQotc3RydWN0
IGRwY2RfZHNjX2Jhc2ljX2NhcGFiaWxpdGllcyB7Ci0JdW5pb24gewotCQlzdHJ1Y3QgewotCQkJ
Ly8gQnl0ZSAwCi0JCQlzdHJ1Y3QgewotCQkJCXVuc2lnbmVkIGNoYXIgZHNjX3N1cHBvcnQJCTox
OyAvLyBCaXQwCi0JCQkJdW5zaWduZWQgY2hhciBkc2NfcGFzc3Rocm91Z2hfc3VwcG9ydAk6MTsg
Ly8gQml0MQotCQkJCXVuc2lnbmVkIGNoYXIgcmVzZXJ2ZWQJCQk6NjsKLQkJCX0gZHNjX3N1cHBv
cnQ7Ci0KLQkJCS8vIEJ5dGUgMQotCQkJc3RydWN0IHsKLQkJCQl1bnNpZ25lZCBjaGFyIGRzY192
ZXJzaW9uX21ham9yCTo0OwotCQkJCXVuc2lnbmVkIGNoYXIgZHNjX3ZlcnNpb25fbWlub3IJOjQ7
Ci0JCQl9IGRzY19hbGdvcml0aG1fcmV2aXNpb247Ci0KLQkJCS8vIEJ5dGUgMgotCQkJc3RydWN0
IHsKLQkJCQl1bnNpZ25lZCBjaGFyIHJjX2Jsb2NrX2J1ZmZlcl9zaXplCToyOwotCQkJCXVuc2ln
bmVkIGNoYXIgcmVzZXJ2ZWQJOjY7Ci0JCQl9IGRzY19yY19idWZmZXJfYmxvY2tfc2l6ZTsKLQot
CQkJLy8gQnl0ZSAzCi0JCQl1bnNpZ25lZCBjaGFyIGRzY19yY19idWZmZXJfc2l6ZTsKLQotCQkJ
Ly8gQnl0ZSA0Ci0JCQlzdHJ1Y3QgewotCQkJCXVuc2lnbmVkIGNoYXIgb25lX3NsaWNlX3Blcl9k
cF9kc2Nfc2lua19kZXZpY2UJCToxOyAvLyBCaXQwCi0JCQkJdW5zaWduZWQgY2hhciB0d29fc2xp
Y2VzX3Blcl9kcF9kc2Nfc2lua19kZXZpY2UJCToxOwotCQkJCXVuc2lnbmVkIGNoYXIgcmVzZXJ2
ZWQJCQkJCToxOwotCQkJCXVuc2lnbmVkIGNoYXIgZm91cl9zbGljZXNfcGVyX2RwX2RzY19zaW5r
X2RldmljZQk6MTsKLQkJCQl1bnNpZ25lZCBjaGFyIHNpeF9zbGljZXNfcGVyX2RwX2RzY19zaW5r
X2RldmljZQkJOjE7IC8vIEJpdCA0Ci0JCQkJdW5zaWduZWQgY2hhciBlaWdodF9zbGljZXNfcGVy
X2RwX2RzY19zaW5rX2RldmljZQk6MTsKLQkJCQl1bnNpZ25lZCBjaGFyIHRlbl9zbGljZXNfcGVy
X2RwX2RzY19zaW5rX2RldmljZQkJOjE7Ci0JCQkJdW5zaWduZWQgY2hhciB0d2VsdmVfc2xpY2Vz
X3Blcl9kcF9kc2Nfc2lua19kZXZpY2UJOjE7Ci0JCQl9IGRzY19zbGljZV9jYXBhYmlsaXRpZXNf
MTsKLQotCQkJLy8gQnl0ZSA1Ci0JCQlzdHJ1Y3QgewotCQkJCXVuc2lnbmVkIGNoYXIgbGluZV9i
dWZmZXJfYml0X2RlcHRoCTo0OwotCQkJCXVuc2lnbmVkIGNoYXIgcmVzZXJ2ZWQJCQk6NDsKLQkJ
CX0gZHNjX2xpbmVfYnVmZmVyX2JpdF9kZXB0aDsKLQotCQkJLy8gQnl0ZSA2Ci0JCQlzdHJ1Y3Qg
ewotCQkJCXVuc2lnbmVkIGNoYXIgYmxvY2tfcHJlZGljdGlvbl9zdXBwb3J0CToxOwotCQkJCXVu
c2lnbmVkIGNoYXIgcmVzZXJ2ZWQJCQk6NzsKLQkJCX0gZHNjX2Jsb2NrX3ByZWRpY3Rpb25fc3Vw
cG9ydDsKLQotCQkJLy8gQnl0ZSA3LDgKLQkJCXN0cnVjdCB7Ci0JCQkJdW5zaWduZWQgY2hhciBt
YXhpbXVtX2JpdHNfcGVyX3BpeGVsX3N1cHBvcnRlZF9ieV90aGVfZGVjb21wcmVzc29yX2xvdwk6
NzsKLQkJCQl1bnNpZ25lZCBjaGFyIG1heGltdW1fYml0c19wZXJfcGl4ZWxfc3VwcG9ydGVkX2J5
X3RoZV9kZWNvbXByZXNzb3JfaGlnaAk6NzsKLQkJCX0gbWF4aW11bV9iaXRzX3Blcl9waXhlbF9z
dXBwb3J0ZWRfYnlfdGhlX2RlY29tcHJlc3NvcjsKLQotCQkJLy8gQnl0ZSA5Ci0JCQlzdHJ1Y3Qg
ewotCQkJCXVuc2lnbmVkIGNoYXIgcmdiX3N1cHBvcnQJCQk6MTsgLy8gQml0MAotCQkJCXVuc2ln
bmVkIGNoYXIgeV9jYl9jcl80NDRfc3VwcG9ydAkJOjE7Ci0JCQkJdW5zaWduZWQgY2hhciB5X2Ni
X2NyX3NpbXBsZV80MjJfc3VwcG9ydAk6MTsKLQkJCQl1bnNpZ25lZCBjaGFyIHlfY2JfY3JfbmF0
aXZlXzQyMl9zdXBwb3J0CToxOwotCQkJCXVuc2lnbmVkIGNoYXIgeV9jYl9jcl9uYXRpdmVfNDIw
X3N1cHBvcnQJOjE7IC8vIEJpdCA0Ci0JCQkJdW5zaWduZWQgY2hhciByZXNlcnZlZAkJCQk6MzsK
LQkJCX0gZHNjX2RlY29kZXJfY29sb3JfZm9ybWF0X2NhcGFiaWxpdGllczsKLQotCQkJLy8gQnl0
ZSAxMAotCQkJc3RydWN0IHsKLQkJCQl1bnNpZ25lZCBjaGFyIHJlc2VydmVkMAkJCQk6MTsgLy8g
Qml0MAotCQkJCXVuc2lnbmVkIGNoYXIgZWlnaHRfYml0c19wZXJfY29sb3Jfc3VwcG9ydAk6MTsK
LQkJCQl1bnNpZ25lZCBjaGFyIHRlbl9iaXRzX3Blcl9jb2xvcl9zdXBwb3J0CToxOwotCQkJCXVu
c2lnbmVkIGNoYXIgdHdlbHZlX2JpdHNfcGVyX2NvbG9yX3N1cHBvcnQJOjE7Ci0JCQkJdW5zaWdu
ZWQgY2hhciByZXNlcnZlZDEJCQkJOjQ7IC8vIEJpdCA0Ci0JCQl9IGRzY19kZWNvZGVyX2NvbG9y
X2RlcHRoX2NhcGFiaWxpdGllczsKLQotCQkJLy8gQnl0ZSAxMQotCQkJc3RydWN0IHsKLQkJCQl1
bnNpZ25lZCBjaGFyIHRocm91Z2hwdXRfbW9kZV8wCQkJOjQ7Ci0JCQkJdW5zaWduZWQgY2hhciB0
aHJvdWdocHV0X21vZGVfMQkJCTo0OwotCQkJfSBwZWFrX2RzY190aHJvdWdocHV0X2RzY19zaW5r
OwotCi0JCQkvLyBCeXRlIDEyCi0JCQl1bnNpZ25lZCBjaGFyIGRzY19tYXhpbXVtX3NsaWNlX3dp
ZHRoOwotCi0JCQkvLyBCeXRlIDEzCi0JCQlzdHJ1Y3QgewotCQkJCXVuc2lnbmVkIGNoYXIgc2l4
dGVlbl9zbGljZXNfcGVyX2RzY19zaW5rX2RldmljZQk6MTsKLQkJCQl1bnNpZ25lZCBjaGFyIHR3
ZW50eV9zbGljZXNfcGVyX2RzY19zaW5rX2RldmljZQkJOjE7Ci0JCQkJdW5zaWduZWQgY2hhciB0
d2VudHlmb3VyX3NsaWNlc19wZXJfZHNjX3NpbmtfZGV2aWNlCToxOwotCQkJCXVuc2lnbmVkIGNo
YXIgcmVzZXJ2ZWQJCQkJCTo1OwotCQkJfSBkc2Nfc2xpY2VfY2FwYWJpbGl0aWVzXzI7Ci0KLQkJ
CS8vIEJ5dGUgMTQKLQkJCXVuc2lnbmVkIGNoYXIgcmVzZXJ2ZWQ7Ci0KLQkJCS8vIEJ5dGUgMTUK
LQkJCXN0cnVjdCB7Ci0JCQkJdW5zaWduZWQgY2hhciBpbmNyZW1lbnRfb2ZfYml0c19wZXJfcGl4
ZWxfc3VwcG9ydGVkCTozOwotCQkJCXVuc2lnbmVkIGNoYXIgcmVzZXJ2ZWQJCQkJCTo1OwotCQkJ
fSBiaXRzX3Blcl9waXhlbF9pbmNyZW1lbnQ7Ci0JCX0gZmllbGRzOwotCQl1bnNpZ25lZCBjaGFy
IHJhd1sxNl07Ci0JfTsKLX07Ci0KLXN0cnVjdCBkcGNkX2RzY19leHRfY2FwYWJpbGl0aWVzIHsK
LQl1bmlvbiB7Ci0JCXN0cnVjdCB7Ci0JCQl1bnNpZ25lZCBjaGFyIGJyYW5jaF9vdmVyYWxsX3Ro
cm91Z2hwdXRfMDsgLy8gQnl0ZSAwCi0JCQl1bnNpZ25lZCBjaGFyIGJyYW5jaF9vdmVyYWxsX3Ro
cm91Z2hwdXRfMTsgLy8gQnl0ZSAxCi0JCQl1bnNpZ25lZCBjaGFyIGJyYW5jaF9tYXhfbGluZV93
aWR0aDsgLy8gQnl0ZSAyCi0JCX0gZmllbGRzOwotCQl1bnNpZ25lZCBjaGFyIHJhd1szXTsKLQl9
OwotfTsKLQotc3RydWN0IGRwY2RfZHNjX2NhcGFiaWxpdGllcyB7Ci0Jc3RydWN0IGRwY2RfZHNj
X2Jhc2ljX2NhcGFiaWxpdGllcyBkc2NfYmFzaWNfY2FwczsKLQlzdHJ1Y3QgZHBjZF9kc2NfZXh0
X2NhcGFiaWxpdGllcyBkc2NfZXh0X2NhcHM7Ci19OwotCi1zdHJ1Y3QgZHBjZF9mZWNfY2FwYWJp
bGl0eSB7Ci0JdW5pb24gewotCQlzdHJ1Y3QgewotCQkJLy8gQnl0ZSAwCi0JCQl1bnNpZ25lZCBj
aGFyIGZlY19jYXBhYmxlCQkJCToxOyAvLyBCaXQwCi0JCQl1bnNpZ25lZCBjaGFyIHVuY29ycmVj
dGVkX2Jsb2NrX2Vycm9yX2NvdW50X2NhcGFibGUJOjE7Ci0JCQl1bnNpZ25lZCBjaGFyIGNvcnJl
Y3RlZF9ibG9ja19lcnJvcl9jb3VudF9jYXBhYmxlCToxOwotCQkJdW5zaWduZWQgY2hhciBiaXRf
ZXJyb3JfY291bnRfY2FwYWJsZQkJCToxOwotCQkJdW5zaWduZWQgY2hhciByZXNlcnZlZAkJCQkJ
OjQ7IC8vIEJpdDQKLQkJfSBmaWVsZHM7Ci0JCXVuc2lnbmVkIGNoYXIgcmF3WzFdOwotCX07Ci19
OwotCi0jZW5kaWYKLQotI2VuZGlmIC8qIERBTF9JTkNMVURFX0RQQ0RfU1RSVUNUU19IXyAqLwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
