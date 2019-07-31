Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C847CB26
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D0C89B62;
	Wed, 31 Jul 2019 17:58:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9D289AEB
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:30 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id b200so13819077vkf.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cW20TcM0ZzJ+LPs1/pe3ZmWQAdgIX82uvcoXYYuM1yA=;
 b=k9V/YChKbN3ebcA78oSB4bXWhw4VUO9l21RekkTxgovyR+AgyciOaXmY9lTMFDyiVm
 Z3elhGlNDK0PyAwv/K/PXLGbaiTmbkiMFsTWubxs4pwPDBd4iKlk3rE8uusP7+muaC7k
 8d3IkWhFfYlye39rZejtWB2U4yO8dsDm1iN7ay4g+oHZnMaftGh5tn5k6BoTksGeKO/F
 dTDvbvzxPlaQCoWWCPRBxglGHWQGsBsTVYAonY6jcL4NDmXIASPdsdvSdkUQ5Yz7WmGd
 5msS8pwe/anJ/KoCb5BMnUyaeDhXhvVw/Qa7v95V5GbjlcylDt+3W1S0+/SWnFjOph9x
 Ys1w==
X-Gm-Message-State: APjAAAUiZK4m5BappoS2InCMf3GIYB/fFlA5IlOOWkiWp1tnx0buG1Uf
 DpMp8gC4xwm9WMjocI+0jjOhHyTr
X-Google-Smtp-Source: APXvYqzxY7CleAkusn2srSvMijN+MEXaXhsR7BE0O6V7CMjGhcoGWOh9F/0K8O8f46DK7pro4dLfcw==
X-Received: by 2002:a1f:9611:: with SMTP id y17mr50306580vkd.9.1564595908999; 
 Wed, 31 Jul 2019 10:58:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/26] drm/amdgpu: add amdgpu_umc_functions structure
Date: Wed, 31 Jul 2019 12:57:55 -0500
Message-Id: <20190731175818.20159-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cW20TcM0ZzJ+LPs1/pe3ZmWQAdgIX82uvcoXYYuM1yA=;
 b=fgO62dc7MhWyWEFPyZVyngySDfWJbutSZY0pJczwifOD1B7/djWQ2Nt7XXapo0zjwu
 h01LqUSOzPn4EqWaqclyAqCouAeU7WoyJbtXtAT+OZb3K4d1RBX42NZQPxnnLh4K0bk5
 rc2M3TQb7EIFkT90G6z9G5khwjlLN/GhSPEIw9Cd2514oS1chycRnYtg4Ue7on0vyyXg
 PSM+4Xth1FgtuK61lbPll94laBUQaRg9L9s6N8JBii3xxzywOp4v8gHsb+X6P0vtay7o
 C8AzEyWlgcgCFUF9CvGCNhDK1ueuS61bu2JdbMnA5nwQ+Dl4yp1dLdcKUU989+vxPEPM
 Sdqw==
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
Cc: Dennis Li <dennis.li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGhpcyBpcyBjb21t
b24gc3RydWN0dXJlIGFzIFVNQyBjYWxsYmFjayBmdW5jdGlvbgoKU2lnbmVkLW9mZi1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRGVubmlzIExp
IDxkZW5uaXMubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaCAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5o
IHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCBhMTk3ZjRi
MzNlZGEuLjcyZDAzMzFmNGNhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAg
LTg2LDYgKzg2LDcgQEAKICNpbmNsdWRlICJhbWRncHVfc211LmgiCiAjaW5jbHVkZSAiYW1kZ3B1
X2Rpc2NvdmVyeS5oIgogI2luY2x1ZGUgImFtZGdwdV9tZXMuaCIKKyNpbmNsdWRlICJhbWRncHVf
dW1jLmgiCiAKICNkZWZpbmUgTUFYX0dQVV9JTlNUQU5DRQkJMTYKIApAQCAtOTcwLDYgKzk3MSw3
IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAogCWNvbnN0IHN0cnVjdCBhbWRncHVfbmJpb19m
dW5jcwkqbmJpb19mdW5jczsKIAljb25zdCBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzCSpkZl9mdW5j
czsKKwljb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcwkqdW1jX2Z1bmNzOwogCiAJLyogZGVs
YXllZCB3b3JrX2Z1bmMgZm9yIGRlZmVycmluZyBjbG9ja2dhdGluZyBkdXJpbmcgcmVzdW1lICov
CiAJc3RydWN0IGRlbGF5ZWRfd29yayAgICAgZGVsYXllZF9pbml0X3dvcms7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi4xZWUxYTAwZTVhYzgKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTAsMCArMSwyOSBAQAorLyoKKyAqIENvcHly
aWdodCAoQykgMjAxOSAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1p
c3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9i
dGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1l
bnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICog
dGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1
dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBh
bmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hl
ZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICog
VGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hh
bGwgYmUgaW5jbHVkZWQKKyAqIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMi
LCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTCisgKiBPUiBJTVBMSUVELCBJ
TkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJ
TElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5H
RU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgQkUg
TElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLCBXSEVUSEVS
IElOCisgKiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5H
IEZST00sIE9VVCBPRiBPUiBJTgorICogQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqLworI2lmbmRlZiBf
X0FNREdQVV9VTUNfSF9fCisjZGVmaW5lIF9fQU1ER1BVX1VNQ19IX18KKworc3RydWN0IGFtZGdw
dV91bWNfZnVuY3MgeworCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3JfY291bnQpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAorCQkJCQl2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKTsKK307CisKKyNl
bmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
