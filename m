Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA02F1FFD
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Jan 2021 20:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2FD6E0CC;
	Mon, 11 Jan 2021 19:54:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4E89E2A
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a12so915076wrv.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+UK/qW8zyZ1jZCT/24Q1f8i1ILtoK1GZqqcObzyOGM=;
 b=DvGExxxyn3oqRzhlGqr5YgtbW3eoDFbk0Jpz4hbgESXe2lcLEUBnV/gcVyOdnnhXIp
 sHQNrPWUAeKdLr0SFUEbsOFKvo/uyhoerxmF7P/x4CnE3oi0YXuvIKRMHCrktk7Vq3YK
 QDke9hcU7aC+/WtoDoeFNRHs22v8Ox2+epuhQvcsq7EoM4gnBKAiCd6pOv6TFnPDGieR
 kc9aJrqGrWjchXJpi153LVXiq7ZcqRHuzRrVwMKfQ5T4G5SIRHOGe6iEjWVMSzioI6Na
 YeB6CydYIUAZ6w/pFgOEY/VfN2uYdrU5o6x3eKwzhT2XSJnNnBXaA7K3CFdu8FMYxqxq
 BhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+UK/qW8zyZ1jZCT/24Q1f8i1ILtoK1GZqqcObzyOGM=;
 b=CcP99DMfcnCnIDMBll5iC+yVgYgszBBRU5Hk1y9L5jFswxi+1dIvGBGAx89ftalz48
 gLFDmf2umIyy+ZhZcgEnLkSls8lY4nUbFGtfWrYSs9fe0oScasFDb13wqAUFgJT5vXq1
 TGIsjhtoV3hFH4pXvbqu95AGsh8vSQXaz1uJk9yw8jqrq8xqW9pEtR5oThRUrY5c0Jca
 SHoAKsP6H8Lwm/feroNPJUICNQiyUt8VQR17b+w1T5eeNtqizUXlwlz/+x/QJidvxsk9
 7g/1NW59XY00GyXDQvFT10RoHMid5RoJ5SZ6On8JP+92hVDTVjxSc1p9mXDlMllkIxuj
 M1mA==
X-Gm-Message-State: AOAM531pf2/JLI73RdaYlVr3HTnVkkLDXOiTiHZOOVfzbNlarwJfpEZe
 IGA9e2Ohtzbgee6M1nM7gRm2Kw==
X-Google-Smtp-Source: ABdhPJwDJ0LuUahJhXPa/BTZ+z7Ot3PI+CIZgcG7Qk4z+wGylDnTKxp8STe+AdFo8eFnvhSPMQwYUQ==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr597601wrw.372.1610392785890; 
 Mon, 11 Jan 2021 11:19:45 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/40] drm/amd/display/dc/dce120/Makefile: Ignore
 -Woverride-init warning
Date: Mon, 11 Jan 2021 19:18:58 +0000
Message-Id: <20210111191926.3688443-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Jan 2021 19:54:43 +0000
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

VGhpcyBmaWxlIHVzZXMgYSBjb21wbGV4IGFic3RyYWN0ZWQgc2V0IG9mIGhpZXJhcmNoaWNhbCBt
YWNyb3MgdG8Kc2V0dXAgaXRzIGFwcGxpY2FibGUgcmVnaXN0ZXIgbGlzdHMgd2l0aGluIGNvbnN0
YW50IHN0cnVjdHVyZXMuCkhvd2V2ZXIgaW4gdGhlIGNhc2Ugb2YgVE1EU19DTlRMIHdlIHdpc2gg
dG8gbWFyayBpdCBhcyBub3QgYXBwbGljYWJsZQpmb3IgdGhpcyB1c2UtY2FzZS4KCk9uZSBtZXRo
b2Qgd291bGQgYmUgdG8gZGUtY29uc3QgYWxsIG9mIHRoZSBkZWZpbml0aW9ucyBhbmQgdXNlcnMs
IHRoZW4KbWFudWFsbHkgemVybyBvdXQgVE1EU19DTlRMIGZyb20gdGhlIGxpc3QuICBBbm90aGVy
IHdvdWxkIGJlIHRvIGNyZWF0ZQphIG5ldyBzZXQgb2YgaGllcmFyY2hpY2FsIG1hY3JvcyB0byBv
bWl0IFRNRFNfQ05UTCBlbnRpcmVseS4gIEJvdGgKd291bGQgZW50YWlsIGEgZ3JlYXQgZGVhbCBv
ZiB1bm5lY2Vzc2FyeSBjaGFuZ2VzIGFuZCBtYWludGVuYW5jZQpidXJkZW4uCgpJbnN0ZWFkLCBs
ZXQncyBqdXN0IHNpbGVuY2UgdGhlIHdhcm5pbmcuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBr
ZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRp
YWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyODE6
Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVnc+KAmQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291
cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3RyZWFtX2Vu
Y19yZWdzWzBdLlRNRFNfQ05UTOKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4MToyOiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5p
bmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3Vy
Y2UuYzoyODI6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVn
c+KAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNl
MTIwX3Jlc291cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCY
c3RyZWFtX2VuY19yZWdzWzFdLlRNRFNfQ05UTOKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4MjoyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6
MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWlu
aXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2Ux
MjBfcmVzb3VyY2UuYzoyODM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVh
bV9lbmNfcmVnc+KAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlv
biBmb3Ig4oCYc3RyZWFtX2VuY19yZWdzWzJdLlRNRFNfQ05UTOKAmSkKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4Mzoy
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz4oCZCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3Vy
Y2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292
ZXJyaWRlLWluaXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyODQ6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmHN0cmVhbV9lbmNfcmVnc+KAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjc3OjE1OiBub3RlOiAobmVhciBpbml0
aWFsaXphdGlvbiBmb3Ig4oCYc3RyZWFtX2VuY19yZWdzWzNdLlRNRFNfQ05UTOKAmSkKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJj
ZS5jOjI4NDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RyZWFtX2VuY19yZWdz
4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2Ux
MjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0
dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyODU6Mjogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVnc+KAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjc3OjE1OiBub3RlOiAo
bmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3RyZWFtX2VuY19yZWdzWzRdLlRNRFNfQ05UTOKA
mSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEy
MF9yZXNvdXJjZS5jOjI4NToyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RyZWFt
X2VuY19yZWdz4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyNzc6MTU6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxk
IG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzoyODY6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHN0cmVhbV9lbmNfcmVnc+KAmQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6Mjc3OjE1
OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3RyZWFtX2VuY19yZWdzWzVdLlRN
RFNfQ05UTOKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNl
MTIwL2RjZTEyMF9yZXNvdXJjZS5jOjI4NjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYc3RyZWFtX2VuY19yZWdz4oCZCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL01ha2VmaWxlIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMjAvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlMTIwL01ha2VmaWxlCmluZGV4IDM3ZGIxZjhkNDVlYTUuLmE5Y2M0YjczMjcwYmIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvTWFrZWZpbGUKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9NYWtlZmlsZQpAQCAtMjQs
NiArMjQsOCBAQAogIyBJdCBwcm92aWRlcyB0aGUgY29udHJvbCBhbmQgc3RhdHVzIG9mIEhXIENS
VEMgYmxvY2suCiAKIAorQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNlMTIwL2RjZTEyMF9yZXNv
dXJjZS5vID0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgb3ZlcnJpZGUtaW5pdCkKKwogRENF
MTIwID0gZGNlMTIwX3Jlc291cmNlLm8gZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IubyBcCiBkY2Ux
MjBfaHdfc2VxdWVuY2VyLm8KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
