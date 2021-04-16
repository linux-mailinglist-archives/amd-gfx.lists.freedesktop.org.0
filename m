Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900036262C
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Apr 2021 18:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390006EC7D;
	Fri, 16 Apr 2021 16:57:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071D16EC03
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m3so32537276edv.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6vojmZkPJ0W/HM2G539IcIFG9CT0JLwxTEhHQdKtaY=;
 b=rm9JZIGI7J8NRlsShT3Jm2NylnVTVIfGIeKW7Q1CXc8kPPNkWZKGqQ6MoWeTDN+jAM
 u2Dybq6Xdr1oghJSAxt/2RBf3XkhmwCSdKZuh6DGDh8XhyGoVk3FQrqp/6PoCIv5weuO
 PD1mxtYjsGeHgTVQYJk3Rcld+NVV6SY6H6Hg6kRv+SvOknye8SHOZSveDpoc92p1m4OC
 QWZw1sqOd5ppK/hMGjGSHPLowZpmCo2Vd0IazZLwQxaH3IE3jLa9MSoOH9A91pauiC10
 rc2kusC6vNjyYx06Va744Lews3kxxZkiTSM29kInghaUCaxCe0JGVE/DNBzrir9RV0j2
 xaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6vojmZkPJ0W/HM2G539IcIFG9CT0JLwxTEhHQdKtaY=;
 b=QVVk/FWA1ln6RY3WCS/O9+/P5dgMbE/CxajrOerAoOd2e6pNtQOApi6OPVPw85zDgK
 8aNiQ4FHO8sk19TZpAGAeNI33ZzSqAFH/qY+wMJv4XOYqDTG6bC7s30SuNzPq6/czCE1
 S/HcabjiyGwdwXbgMgGDhBoJEsavKyAj000XoVI0rR2TOAGnvfZhk+MC1XLY3C9O0gTL
 UGKTlLPtVswx9imalZVq/hRn8+XhMOBBmcQC7Wo+ZfEyd8HPAeSbYDqh4xfzYOeJ5oQJ
 3uNXZhXhNF9dDFEhUM4tvxbtguctnU2Hcypwb7DcLDXO5Ce6Nl3XoLQtY/fGVkPI80qZ
 9/+Q==
X-Gm-Message-State: AOAM531mNqfqanXPqXVhyILcqYsdMkCHtlwWrnUOKKYbrkVHcuIcPpRH
 ALwBfMez6gKVEA+Unb+tWyHjrw==
X-Google-Smtp-Source: ABdhPJzm0j3Stuq4xPY8GX3G7xb61sxgZBcqIhiy5LHrxAjAX1VCvOlb9r5FvP0WCOuRJS4mdeFOIg==
X-Received: by 2002:a05:6402:1741:: with SMTP id
 v1mr10264129edx.127.1618583877582; 
 Fri, 16 Apr 2021 07:37:57 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/40] drm/amd/amdgpu/amdgpu_device: Remove unused variable 'r'
Date: Fri, 16 Apr 2021 15:37:11 +0100
Message-Id: <20210416143725.2769053-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Apr 2021 16:57:23 +0000
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOiBJbiBmdW5jdGlvbiDigJhhbWRn
cHVfZGV2aWNlX3N1c3BlbmTigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmM6MzczMzo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhy4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKaW5kZXggYjRhZDFjMDU1YzcwMi4uZWVmNTRiMjY1ZmZkZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzczMCw3ICszNzMwLDYgQEAg
dm9pZCBhbWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiBpbnQg
YW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgZmJjb24p
CiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkcm1fdG9fYWRldihkZXYpOwotCWlu
dCByOwogCiAJaWYgKGRldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID09IERSTV9TV0lUQ0hfUE9XRVJf
T0ZGKQogCQlyZXR1cm4gMDsKQEAgLTM3NDUsNyArMzc0NCw3IEBAIGludCBhbWRncHVfZGV2aWNl
X3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCBmYmNvbikKIAogCWFtZGdwdV9y
YXNfc3VzcGVuZChhZGV2KTsKIAotCXIgPSBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2Ux
KGFkZXYpOworCWFtZGdwdV9kZXZpY2VfaXBfc3VzcGVuZF9waGFzZTEoYWRldik7CiAKIAlpZiAo
IWFkZXYtPmluX3MwaXgpCiAJCWFtZGdwdV9hbWRrZmRfc3VzcGVuZChhZGV2LCBhZGV2LT5pbl9y
dW5wbSk7CkBAIC0zNzU1LDcgKzM3NTQsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgZmJjb24pCiAKIAlhbWRncHVfZmVuY2VfZHJpdmVy
X3N1c3BlbmQoYWRldik7CiAKLQlyID0gYW1kZ3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMihh
ZGV2KTsKKwlhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UyKGFkZXYpOwogCS8qIGV2aWN0
IHJlbWFpbmluZyB2cmFtIG1lbW9yeQogCSAqIFRoaXMgc2Vjb25kIGNhbGwgdG8gZXZpY3QgdnJh
bSBpcyB0byBldmljdCB0aGUgZ2FydCBwYWdlIHRhYmxlCiAJICogdXNpbmcgdGhlIENQVS4KLS0g
CjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
