Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB442C62D8
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923636EC08;
	Fri, 27 Nov 2020 10:15:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF0D6E98D
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x22so2182314wmc.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OAy1jRBTuNLPEHs/IXnokv+zNFaXcfFnOzJRsPBonE0=;
 b=SPTU9J2onyq2/XfSieB6u7AH3glpdPGvhmzSX3HJXoTSMfOTHMvK+Hckq7OHwcT5c8
 nMz2ecjWqsf3eR95wiufhXwqvFtVokgNJnANAEtpnikhBUVWb4IApNYv5tRct69yKWht
 8vMDT005lM9fiCQVEfDQrkmGK6OTLch+KMRqiXcxJsY8df7z7nFWy/Qxxedis58l58XJ
 wyu90Jjl/9wajPkoyiq4SH6mMhOOJGNlQfgzcAWkC78bxsfK1Wq6YID35dlschDhkHIY
 PZkJx0cinT7BfcUdSJWOzilPUw10Vm+1qJ1wDXind70xKEGJ4n2vDKjvUABmT5VQ+ujl
 iq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OAy1jRBTuNLPEHs/IXnokv+zNFaXcfFnOzJRsPBonE0=;
 b=jzOMc5Doliox70yM3n37AGxX4Y1jsHYsaZdA6+srWAGmr9HZepJzTQuexgksPkBv3B
 AJOfbbdm/nWTS6rOCO8x539TwCMPbMBzLh3aQ/NNbOOcFKGOhqtF3QpkREUUtoCmUcxP
 xm6s5SjZPXIMPysBFnBS2zdAcYIa8RR8xYT0w/wzBf1WsS+uMDl/RFH0aPts3PF8gFWn
 AvRDIVsoee6OIS1Rzwp4vxe3RPcgYAEFx5vWlgdNT8/j0Vur+5AVbmQph/nqS8AiPEMW
 UNFRdGX69JwlRvqULleW85wPZ7mKgAIaaFroI/Gctca+ql/ubniLWJZRBXOBDOeNxLsG
 0E5w==
X-Gm-Message-State: AOAM532BTUavFeeO8x2O6sgaynuwGjSDWI32xzzyfR70iNlqf6c4rtrZ
 VcjDxfahSYfXXH9tWCML3jQa6Q==
X-Google-Smtp-Source: ABdhPJyrIuGbGAFK6cCNbi887UT+vTL3eGrZMw/5tagoDRi/oTCsGa25Ce80vqYgDTfdzpRIdh4OxA==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr3487702wma.92.1606398218319; 
 Thu, 26 Nov 2020 05:43:38 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/40] drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu: Mark local
 functions invoked by reference as static
Date: Thu, 26 Nov 2020 13:42:36 +0000
Message-Id: <20201126134240.3214176-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:14:32 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3Nt
dS5jOjUzODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBwX3J2X3Nl
dF93bV9yYW5nZXPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjU5MDo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBwX3J2X3NldF9wbWVfd2FfZW5h
Ymxl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzo2MDE6Njogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwcF9ydl9zZXRfYWN0aXZlX2Rpc3BsYXlfY291
bnTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjYxNDo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBwX3J2X3NldF9taW5fZGVlcF9zbGVlcF9kY2Zj
bGvigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjYyNzo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBwX3J2X3NldF9oYXJkX21pbl9kY2VmY2xrX2J5
X2ZyZXHigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjY0MDo2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBwX3J2X3NldF9oYXJkX21pbl9mY2xrX2J5
X2ZyZXHigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
Li4uL2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jICAgfCAxNCAr
KysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9wcF9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX3BwX3NtdS5jCmluZGV4IDg0MDY1YzEyZDRiODUuLmFjMGEwNTM5ODU0ZWYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX3BwX3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX3BwX3NtdS5jCkBAIC01MzUsNyArNTM1LDcgQEAgYm9vbCBkbV9wcF9nZXRfc3Rh
dGljX2Nsb2NrcygKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotdm9pZCBwcF9ydl9zZXRfd21fcmFuZ2Vz
KHN0cnVjdCBwcF9zbXUgKnBwLAorc3RhdGljIHZvaWQgcHBfcnZfc2V0X3dtX3JhbmdlcyhzdHJ1
Y3QgcHBfc211ICpwcCwKIAkJc3RydWN0IHBwX3NtdV93bV9yYW5nZV9zZXRzICpyYW5nZXMpCiB7
CiAJY29uc3Qgc3RydWN0IGRjX2NvbnRleHQgKmN0eCA9IHBwLT5kbTsKQEAgLTU4Nyw3ICs1ODcs
NyBAQCB2b2lkIHBwX3J2X3NldF93bV9yYW5nZXMoc3RydWN0IHBwX3NtdSAqcHAsCiAJCQkJCQkJ
ICAgJndtX3dpdGhfY2xvY2tfcmFuZ2VzKTsKIH0KIAotdm9pZCBwcF9ydl9zZXRfcG1lX3dhX2Vu
YWJsZShzdHJ1Y3QgcHBfc211ICpwcCkKK3N0YXRpYyB2b2lkIHBwX3J2X3NldF9wbWVfd2FfZW5h
YmxlKHN0cnVjdCBwcF9zbXUgKnBwKQogewogCWNvbnN0IHN0cnVjdCBkY19jb250ZXh0ICpjdHgg
PSBwcC0+ZG07CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjdHgtPmRyaXZlcl9jb250
ZXh0OwpAQCAtNTk4LDcgKzU5OCw3IEBAIHZvaWQgcHBfcnZfc2V0X3BtZV93YV9lbmFibGUoc3Ry
dWN0IHBwX3NtdSAqcHApCiAJCXBwX2Z1bmNzLT5ub3RpZnlfc211X2VuYWJsZV9wd2UocHBfaGFu
ZGxlKTsKIH0KIAotdm9pZCBwcF9ydl9zZXRfYWN0aXZlX2Rpc3BsYXlfY291bnQoc3RydWN0IHBw
X3NtdSAqcHAsIGludCBjb3VudCkKK3N0YXRpYyB2b2lkIHBwX3J2X3NldF9hY3RpdmVfZGlzcGxh
eV9jb3VudChzdHJ1Y3QgcHBfc211ICpwcCwgaW50IGNvdW50KQogewogCWNvbnN0IHN0cnVjdCBk
Y19jb250ZXh0ICpjdHggPSBwcC0+ZG07CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBj
dHgtPmRyaXZlcl9jb250ZXh0OwpAQCAtNjExLDcgKzYxMSw3IEBAIHZvaWQgcHBfcnZfc2V0X2Fj
dGl2ZV9kaXNwbGF5X2NvdW50KHN0cnVjdCBwcF9zbXUgKnBwLCBpbnQgY291bnQpCiAJcHBfZnVu
Y3MtPnNldF9hY3RpdmVfZGlzcGxheV9jb3VudChwcF9oYW5kbGUsIGNvdW50KTsKIH0KIAotdm9p
ZCBwcF9ydl9zZXRfbWluX2RlZXBfc2xlZXBfZGNmY2xrKHN0cnVjdCBwcF9zbXUgKnBwLCBpbnQg
Y2xvY2spCitzdGF0aWMgdm9pZCBwcF9ydl9zZXRfbWluX2RlZXBfc2xlZXBfZGNmY2xrKHN0cnVj
dCBwcF9zbXUgKnBwLCBpbnQgY2xvY2spCiB7CiAJY29uc3Qgc3RydWN0IGRjX2NvbnRleHQgKmN0
eCA9IHBwLT5kbTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGN0eC0+ZHJpdmVyX2Nv
bnRleHQ7CkBAIC02MjQsNyArNjI0LDcgQEAgdm9pZCBwcF9ydl9zZXRfbWluX2RlZXBfc2xlZXBf
ZGNmY2xrKHN0cnVjdCBwcF9zbXUgKnBwLCBpbnQgY2xvY2spCiAJcHBfZnVuY3MtPnNldF9taW5f
ZGVlcF9zbGVlcF9kY2VmY2xrKHBwX2hhbmRsZSwgY2xvY2spOwogfQogCi12b2lkIHBwX3J2X3Nl
dF9oYXJkX21pbl9kY2VmY2xrX2J5X2ZyZXEoc3RydWN0IHBwX3NtdSAqcHAsIGludCBjbG9jaykK
K3N0YXRpYyB2b2lkIHBwX3J2X3NldF9oYXJkX21pbl9kY2VmY2xrX2J5X2ZyZXEoc3RydWN0IHBw
X3NtdSAqcHAsIGludCBjbG9jaykKIHsKIAljb25zdCBzdHJ1Y3QgZGNfY29udGV4dCAqY3R4ID0g
cHAtPmRtOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5kcml2ZXJfY29udGV4
dDsKQEAgLTYzNyw3ICs2MzcsNyBAQCB2b2lkIHBwX3J2X3NldF9oYXJkX21pbl9kY2VmY2xrX2J5
X2ZyZXEoc3RydWN0IHBwX3NtdSAqcHAsIGludCBjbG9jaykKIAlwcF9mdW5jcy0+c2V0X2hhcmRf
bWluX2RjZWZjbGtfYnlfZnJlcShwcF9oYW5kbGUsIGNsb2NrKTsKIH0KIAotdm9pZCBwcF9ydl9z
ZXRfaGFyZF9taW5fZmNsa19ieV9mcmVxKHN0cnVjdCBwcF9zbXUgKnBwLCBpbnQgbWh6KQorc3Rh
dGljIHZvaWQgcHBfcnZfc2V0X2hhcmRfbWluX2ZjbGtfYnlfZnJlcShzdHJ1Y3QgcHBfc211ICpw
cCwgaW50IG1oeikKIHsKIAljb25zdCBzdHJ1Y3QgZGNfY29udGV4dCAqY3R4ID0gcHAtPmRtOwog
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5kcml2ZXJfY29udGV4dDsKQEAgLTY2
MSw3ICs2NjEsNyBAQCBzdGF0aWMgZW51bSBwcF9zbXVfc3RhdHVzIHBwX252X3NldF93bV9yYW5n
ZXMoc3RydWN0IHBwX3NtdSAqcHAsCiAJcmV0dXJuIFBQX1NNVV9SRVNVTFRfT0s7CiB9CiAKLWVu
dW0gcHBfc211X3N0YXR1cyBwcF9udl9zZXRfcG1lX3dhX2VuYWJsZShzdHJ1Y3QgcHBfc211ICpw
cCkKK3N0YXRpYyBlbnVtIHBwX3NtdV9zdGF0dXMgcHBfbnZfc2V0X3BtZV93YV9lbmFibGUoc3Ry
dWN0IHBwX3NtdSAqcHApCiB7CiAJY29uc3Qgc3RydWN0IGRjX2NvbnRleHQgKmN0eCA9IHBwLT5k
bTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGN0eC0+ZHJpdmVyX2NvbnRleHQ7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
