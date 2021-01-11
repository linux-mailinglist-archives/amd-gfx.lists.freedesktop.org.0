Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAAD2F1FFB
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Jan 2021 20:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563496E0B7;
	Mon, 11 Jan 2021 19:54:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4037E89E7C
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r7so935337wrc.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbOdfw74w6tzF/CbpPUTEI04qCMhfubS6U9e1XZIp68=;
 b=SY9uAV9V59fYWcmoaIsdXl0k7TXOs4fLfBDFwyidnaBs3Z6B+orrrsAEx5TJwydBzJ
 K8nX3NxXBy5TrL6hieK2vO+NXgHYwhgnT+23Y0dN7lnBpdRCqhPOoRySIRjAXZ+rIblf
 Ih2hh/pbvvd8bVpxE+ZPG57im+0H1wWIzoXVmp0cf7XbY4i6DXuotgud1SXh0lVA2wjc
 8evdy55Ymtzme9Ud/0rATBl2ennpYYn6FzdMnZMcZpSqs7qXa1FcDXhidzIO33tvGmW4
 kOvFJ5cYIEZbrVt0CAMRlPatHx1if33AoandcvoJk5eWivKdkS+aswgmoTX0U9jYD+kL
 7XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbOdfw74w6tzF/CbpPUTEI04qCMhfubS6U9e1XZIp68=;
 b=llRQ6j1oQvQ+BvBHJi87IEdbbcqRnB3Udg5AKMqsIssAuUmV3jH9oCuNl2s5qla7Ai
 LUWNe1iQ3sYwxyjeSWe8hY69x+wwpJBi+lZENNZ6LWSpl6MrZvF/3wDF4CxKSANb9Em4
 Iudtr1Z4+EAcUwERcxlYZpl7ZQci1gXMkfeiZk3KxzoNbxsqx/PpQ4SqfZcqQnVhJwNF
 6x58SX4CYjndtSa4tKHumdu27WLw9d2Uv1ZeoOwc3WoCkxE6LHwZDOxdDnkx6L7RJU08
 AD0Vtmtj9ZSGseTGs/HKK9JLDz8kX9EbL6yuoQu280T8v1nt2U9usk8XnS9mK3/0MJYh
 feKg==
X-Gm-Message-State: AOAM5327J8SwPh2emQpCkRiyCPDZBt7pyiNFnWby013QRJASMfn/T/jF
 D19DIj697/hXXXPu3uB9hpDcTw==
X-Google-Smtp-Source: ABdhPJzDKek8DXrL8V6g03Aep/A7t7ShJc3+WpVXUzrHYSw7+XQi6FpUmv51oh/GzdsdJ0VJJQOnzA==
X-Received: by 2002:adf:c454:: with SMTP id a20mr595775wrg.314.1610392797924; 
 Mon, 11 Jan 2021 11:19:57 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/40] drm/amd/display/dc/dce110/dce110_compressor: Remove
 unused function 'dce110_get_required_compressed_surfacesize
Date: Mon, 11 Jan 2021 19:19:07 +0000
Message-Id: <20210111191926.3688443-22-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNz
b3IuYzo0MTU6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UxMTBf
Z2V0X3JlcXVpcmVkX2NvbXByZXNzZWRfc3VyZmFjZXNpemXigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfY29tcHJlc3Nvci5jIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNzb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNzb3IuYwppbmRleCA3MmI1ODBhNGViODU2
Li4xOGIwYTY5YjBiMWU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfY29tcHJlc3Nvci5jCkBAIC00MTIsMzYgKzQxMiw2IEBA
IHZvaWQgZGNlMTEwX2NvbXByZXNzb3JfZGVzdHJveShzdHJ1Y3QgY29tcHJlc3NvciAqKmNvbXBy
ZXNzb3IpCiAJKmNvbXByZXNzb3IgPSBOVUxMOwogfQogCi1ib29sIGRjZTExMF9nZXRfcmVxdWly
ZWRfY29tcHJlc3NlZF9zdXJmYWNlc2l6ZShzdHJ1Y3QgZmJjX2lucHV0X2luZm8gZmJjX2lucHV0
X2luZm8sCi0JCQkJCQlzdHJ1Y3QgZmJjX3JlcXVlc3RlZF9jb21wcmVzc2VkX3NpemUgc2l6ZSkK
LXsKLQlib29sIHJlc3VsdCA9IGZhbHNlOwotCi0JdW5zaWduZWQgaW50IG1heF94ID0gRkJDX01B
WF9YLCBtYXhfeSA9IEZCQ19NQVhfWTsKLQotCWdldF9tYXhfc3VwcG9ydF9mYmNfYnVmZmVyc2l6
ZSgmbWF4X3gsICZtYXhfeSk7Ci0KLQlpZiAoZmJjX2lucHV0X2luZm8uZHluYW1pY19mYmNfYnVm
ZmVyX2FsbG9jID09IDApIHsKLQkJLyoKLQkJICogRm9yIERDRTExIGhlcmUgdXNlIE1heCBIVyBz
dXBwb3J0ZWQgc2l6ZTogIEhXIFN1cHBvcnQgdXAgdG8gMzg0MHgyNDAwIHJlc29sdXRpb24KLQkJ
ICogb3IgMTgwMDAgY2h1bmtzLgotCQkgKi8KLQkJc2l6ZS5wcmVmZXJyZWRfc2l6ZSA9IHNpemUu
bWluX3NpemUgPSBhbGlnbl90b19jaHVua3NfbnVtYmVyX3Blcl9saW5lKG1heF94KSAqIG1heF95
ICogNDsgIC8qIChGb3IgRkJDIHdoZW4gTFBUIG5vdCBzdXBwb3J0ZWQpLiAqLwotCQlzaXplLnBy
ZWZlcnJlZF9zaXplX2FsaWdubWVudCA9IHNpemUubWluX3NpemVfYWxpZ25tZW50ID0gMHgxMDA7
ICAgICAgIC8qIEZvciBGQkMgd2hlbiBMUFQgbm90IHN1cHBvcnRlZCAqLwotCQlzaXplLmJpdHMu
cHJlZmVycmVkX211c3RfYmVfZnJhbWVidWZmZXJfcG9vbCA9IDE7Ci0JCXNpemUuYml0cy5taW5f
bXVzdF9iZV9mcmFtZWJ1ZmZlcl9wb29sID0gMTsKLQotCQlyZXN1bHQgPSB0cnVlOwotCX0KLQkv
KgotCSAqIE1heWJlIHRvIGFkZCByZWdpc3RyeSBrZXkgc3VwcG9ydCB3aXRoIG9wdGlvbmFsIHNp
emUgaGVyZSB0byBvdmVycmlkZSBhYm92ZQotCSAqIGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMKLQkg
Ki8KLQotCXJldHVybiByZXN1bHQ7Ci19Ci0KLQogdm9pZCBnZXRfbWF4X3N1cHBvcnRfZmJjX2J1
ZmZlcnNpemUodW5zaWduZWQgaW50ICptYXhfeCwgdW5zaWduZWQgaW50ICptYXhfeSkKIHsKIAkq
bWF4X3ggPSBGQkNfTUFYX1g7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAo=
