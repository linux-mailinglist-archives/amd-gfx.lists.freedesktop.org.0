Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF12C62B3
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215CC6EB94;
	Fri, 27 Nov 2020 10:14:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CB76E976
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so2449640wmh.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VvOq+Zi/CHrahUTvogxV5HI9MG7ly8TSlygcZpw2NKU=;
 b=BL/MSEaJ1vyfc+neXkZo3m2nXS6eZ0aJq2FC5IT/mKUL820jhA/u5feEKiEunlhQRe
 zQrtJgdxtDbBbMGMltY+M+UE1ZOxrt6k/gNz9P0FfECY5oyB4sDDv7+66Ae46DZz4Qp0
 b1Ar6OuLKkVNwStteZF2zRBJeM/zrcA0Mtl5wYiafW4xHVcUtedPiY5MYyHCl7cR04vj
 mb9nYE8psZSo9d2mVOkW2q7GN5lvN+nEfn8jAA06B1euZfaZhEISLXjJ715JbAA/JzHX
 3kJc56w90k8d1spd6D5S+No6Ueg3J+iR9U5lQiZXI/MZ+1ZjWTOQgvohp8+OCdo56Whl
 n3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvOq+Zi/CHrahUTvogxV5HI9MG7ly8TSlygcZpw2NKU=;
 b=KFfoy91iFRV8gdXLpOSPsDomYHWz109MCxZgRpIZ479pdqkt8E154Nw9kxHiDQ92x0
 c6zG3dK689PIZJ4doocecF9w00KpW/e45SZa++HfG5k1U10F49GU1ePicKXmR9+gHXwo
 PiyVbB9zcEUsdjFwzA1O43174hjJl4ZOeRoKewHg3aFxpC4ptyLsWg57+DKweAaK//Ew
 cCunoj2KEkdGentaUWglHICRkJ5b6Etw+i8r6Z/UgGXFUClymUh2k+aNaF/iz8i6JUbc
 t9ze52Ev73OXiL1iGHVRmjvVc5pKGA8k8TpyI8bIh5Xjc83BlTtO5UH0I+OG+Ej5E29Z
 LaEA==
X-Gm-Message-State: AOAM532JzegCs13uIEuY8wy30xdWjn9xD6jiTPmf01uDXAwcvHwdSzGk
 w2fXZLcdJLMhgbXgTQBAEbcW5Q==
X-Google-Smtp-Source: ABdhPJzG5LaxzYXvTa7sgaqLrCNzC5Gk/aJzsaBAtTWCgP/By2jMU7TL9EJUN+g6ApNOSDgwYa3RsQ==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr3451218wmf.37.1606398209121; 
 Thu, 26 Nov 2020 05:43:29 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/40] drm/amd/pm/powerplay/hwmgr/vega20_thermal: Fix some
 outdated function documentation
Date: Thu, 26 Nov 2020 13:42:29 +0000
Message-Id: <20201126134240.3214176-30-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFs
LmM6MjE3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90
IGRlc2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFsLmM6
MjQyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRl
c2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfc2V0X3RlbXBlcmF0dXJlX3JhbmdlJwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFs
LmM6MjQyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyYW5nZScgbm90
IGRlc2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfc2V0X3RlbXBlcmF0dXJlX3JhbmdlJwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVy
bWFsLmM6Mjc4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicg
bm90IGRlc2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfZW5hYmxlX2FsZXJ0JwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFsLmM6
Mjk2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRl
c2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfZGlzYWJsZV9hbGVydCcKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfdGhlcm1hbC5jOjMxMDog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaHdtZ3InIG5vdCBkZXNjcmli
ZWQgaW4gJ3ZlZ2EyMF90aGVybWFsX3N0b3BfdGhlcm1hbF9jb250cm9sbGVyJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFsLmM6
MzI2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRl
c2NyaWJlZCBpbiAndmVnYTIwX3RoZXJtYWxfc2V0dXBfZmFuX3RhYmxlJwoKQ2M6IEV2YW4gUXVh
biA8ZXZhbi5xdWFuQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX3RoZXJtYWwuYyAgIHwgNTQgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFsLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfdGhlcm1hbC5jCmluZGV4IDM2
NDE2MmRkYWE5YzYuLjI2OWRkN2U5NWE0NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF90aGVybWFsLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX3RoZXJtYWwuYwpAQCAtMjA5LDEwICsy
MDksMTAgQEAgaW50IHZlZ2EyMF9mYW5fY3RybF9zZXRfZmFuX3NwZWVkX3JwbShzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCB1aW50MzJfdCBzcGVlZCkKIH0KIAogLyoqCi0qIFJlYWRzIHRoZSByZW1v
dGUgdGVtcGVyYXR1cmUgZnJvbSB0aGUgU0lzbGFuZHMgdGhlcm1hbCBjb250cm9sbGVyLgotKgot
KiBAcGFyYW0gICAgaHdtZ3IgVGhlIGFkZHJlc3Mgb2YgdGhlIGhhcmR3YXJlIG1hbmFnZXIuCi0q
LworICogdmVnYTIwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlIC0gUmVhZHMgdGhlIHJlbW90ZSB0
ZW1wZXJhdHVyZSBmcm9tIHRoZSBTSXNsYW5kcyB0aGVybWFsIGNvbnRyb2xsZXIuCisgKgorICog
QGh3bWdyOiBUaGUgYWRkcmVzcyBvZiB0aGUgaGFyZHdhcmUgbWFuYWdlci4KKyAqLwogaW50IHZl
Z2EyMF90aGVybWFsX2dldF90ZW1wZXJhdHVyZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewog
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7CkBAIC0yMzAsMTMgKzIz
MCwxMiBAQCBpbnQgdmVnYTIwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IpCiB9CiAKIC8qKgotKiBTZXQgdGhlIHJlcXVlc3RlZCB0ZW1wZXJhdHVyZSByYW5n
ZSBmb3IgaGlnaCBhbmQgbG93IGFsZXJ0IHNpZ25hbHMKLSoKLSogQHBhcmFtICAgIGh3bWdyIFRo
ZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgotKiBAcGFyYW0gICAgcmFuZ2UgVGVt
cGVyYXR1cmUgcmFuZ2UgdG8gYmUgcHJvZ3JhbW1lZCBmb3IKLSogICAgICAgICAgIGhpZ2ggYW5k
IGxvdyBhbGVydCBzaWduYWxzCi0qIEBleGNlcHRpb24gUFBfUmVzdWx0X0JhZElucHV0IGlmIHRo
ZSBpbnB1dCBkYXRhIGlzIG5vdCB2YWxpZC4KLSovCisgKiB2ZWdhMjBfdGhlcm1hbF9zZXRfdGVt
cGVyYXR1cmVfcmFuZ2UgLSBTZXQgdGhlIHJlcXVlc3RlZCB0ZW1wZXJhdHVyZSByYW5nZSBmb3Ig
aGlnaCBhbmQgbG93IGFsZXJ0IHNpZ25hbHMKKyAqCisgKiBAaHdtZ3I6IFRoZSBhZGRyZXNzIG9m
IHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgorICogQHJhbmdlOiBUZW1wZXJhdHVyZSByYW5nZSB0byBi
ZSBwcm9ncmFtbWVkIGZvciBoaWdoIGFuZCBsb3cgYWxlcnQgc2lnbmFscworICogRXhjZXB0aW9u
OiBQUF9SZXN1bHRfQmFkSW5wdXQgaWYgdGhlIGlucHV0IGRhdGEgaXMgbm90IHZhbGlkLgorICov
CiBzdGF0aWMgaW50IHZlZ2EyMF90aGVybWFsX3NldF90ZW1wZXJhdHVyZV9yYW5nZShzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyLAogCQlzdHJ1Y3QgUFBfVGVtcGVyYXR1cmVSYW5nZSAqcmFuZ2UpCiB7
CkBAIC0yNzAsMTAgKzI2OSwxMCBAQCBzdGF0aWMgaW50IHZlZ2EyMF90aGVybWFsX3NldF90ZW1w
ZXJhdHVyZV9yYW5nZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogfQogCiAvKioKLSogRW5hYmxl
IHRoZXJtYWwgYWxlcnRzIG9uIHRoZSBSVjc3MCB0aGVybWFsIGNvbnRyb2xsZXIuCi0qCi0qIEBw
YXJhbSAgICBod21nciBUaGUgYWRkcmVzcyBvZiB0aGUgaGFyZHdhcmUgbWFuYWdlci4KLSovCisg
KiB2ZWdhMjBfdGhlcm1hbF9lbmFibGVfYWxlcnQgLSBFbmFibGUgdGhlcm1hbCBhbGVydHMgb24g
dGhlIFJWNzcwIHRoZXJtYWwgY29udHJvbGxlci4KKyAqCisgKiBAaHdtZ3I6IFRoZSBhZGRyZXNz
IG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgorICovCiBzdGF0aWMgaW50IHZlZ2EyMF90aGVybWFs
X2VuYWJsZV9hbGVydChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewogCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7CkBAIC0yODksOSArMjg4LDkgQEAgc3RhdGljIGlu
dCB2ZWdhMjBfdGhlcm1hbF9lbmFibGVfYWxlcnQoc3RydWN0IHBwX2h3bWdyICpod21ncikKIH0K
IAogLyoqCi0qIERpc2FibGUgdGhlcm1hbCBhbGVydHMgb24gdGhlIFJWNzcwIHRoZXJtYWwgY29u
dHJvbGxlci4KLSogQHBhcmFtICAgIGh3bWdyIFRoZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBt
YW5hZ2VyLgotKi8KKyAqIHZlZ2EyMF90aGVybWFsX2Rpc2FibGVfYWxlcnQgLSBEaXNhYmxlIHRo
ZXJtYWwgYWxlcnRzIG9uIHRoZSBSVjc3MCB0aGVybWFsIGNvbnRyb2xsZXIuCisgKiBAaHdtZ3I6
IFRoZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgorICovCiBpbnQgdmVnYTIwX3Ro
ZXJtYWxfZGlzYWJsZV9hbGVydChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7CkBAIC0zMDIsMTAgKzMwMSwxMCBAQCBp
bnQgdmVnYTIwX3RoZXJtYWxfZGlzYWJsZV9hbGVydChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQog
fQogCiAvKioKLSogVW5pbml0aWFsaXplIHRoZSB0aGVybWFsIGNvbnRyb2xsZXIuCi0qIEN1cnJl
bnRseSBqdXN0IGRpc2FibGVzIGFsZXJ0cy4KLSogQHBhcmFtICAgIGh3bWdyIFRoZSBhZGRyZXNz
IG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgotKi8KKyAqIHZlZ2EyMF90aGVybWFsX3N0b3BfdGhl
cm1hbF9jb250cm9sbGVyIC0gVW5pbml0aWFsaXplIHRoZSB0aGVybWFsIGNvbnRyb2xsZXIuCisg
KiBDdXJyZW50bHkganVzdCBkaXNhYmxlcyBhbGVydHMuCisgKiBAaHdtZ3I6IFRoZSBhZGRyZXNz
IG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgorICovCiBpbnQgdmVnYTIwX3RoZXJtYWxfc3RvcF90
aGVybWFsX2NvbnRyb2xsZXIoc3RydWN0IHBwX2h3bWdyICpod21ncikKIHsKIAlpbnQgcmVzdWx0
ID0gdmVnYTIwX3RoZXJtYWxfZGlzYWJsZV9hbGVydChod21ncik7CkBAIC0zMTQsMTQgKzMxMyw5
IEBAIGludCB2ZWdhMjBfdGhlcm1hbF9zdG9wX3RoZXJtYWxfY29udHJvbGxlcihzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyKQogfQogCiAvKioKLSogU2V0IHVwIHRoZSBmYW4gdGFibGUgdG8gY29udHJv
bCB0aGUgZmFuIHVzaW5nIHRoZSBTTUMuCi0qIEBwYXJhbSAgICBod21nciAgdGhlIGFkZHJlc3Mg
b2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgotKiBAcGFyYW0gICAgcElucHV0IHRo
ZSBwb2ludGVyIHRvIGlucHV0IGRhdGEKLSogQHBhcmFtICAgIHBPdXRwdXQgdGhlIHBvaW50ZXIg
dG8gb3V0cHV0IGRhdGEKLSogQHBhcmFtICAgIHBTdG9yYWdlIHRoZSBwb2ludGVyIHRvIHRlbXBv
cmFyeSBzdG9yYWdlCi0qIEBwYXJhbSAgICBSZXN1bHQgdGhlIGxhc3QgZmFpbHVyZSBjb2RlCi0q
IEByZXR1cm4gICByZXN1bHQgZnJvbSBzZXQgdGVtcGVyYXR1cmUgcmFuZ2Ugcm91dGluZQotKi8K
KyAqIHZlZ2EyMF90aGVybWFsX3NldHVwX2Zhbl90YWJsZSAtIFNldCB1cCB0aGUgZmFuIHRhYmxl
IHRvIGNvbnRyb2wgdGhlIGZhbiB1c2luZyB0aGUgU01DLgorICogQGh3bWdyOiAgdGhlIGFkZHJl
c3Mgb2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgorICovCiBzdGF0aWMgaW50IHZl
Z2EyMF90aGVybWFsX3NldHVwX2Zhbl90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewog
CWludCByZXQ7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=
