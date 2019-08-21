Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A2798747
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66F76EA39;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F476EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:44 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id b11so5078330qtp.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjWbseaoN5dvEjuV6y0tPmETtvFtfV092Ylhw/3DSEA=;
 b=bQ1rHKOkKJvyhi+c3lirbV1WZ8eEYMUq5Ud+n6NZzMsmvt/nmev3joTrkjFf2JgceL
 oRmv21hTSW5ZS8951x76HrIV6o5SUwiWrp3YzAel9SsaWcYti5SBY15V2SDTx4PLJ1mB
 4LHK+KZaz4qrt7jEuKVOYPF4fhFLpjwb/446dNBuy3cMQ/0J454lLwBkmIR7O2r77V6f
 349nna/AkcSLZAfXk2R8SdgcVcn1wKqU1ldwtaZlFDnGvSgmRadnCuwj9lELgeXD9WhA
 VTIjl5H9P+We2OSds5dvC6nsPM0IrgiMPgJVdm/ivYHGtBDdqC+Jnco9X03P1bx4tFyx
 x+Gg==
X-Gm-Message-State: APjAAAW3egXaPVj3qEG1kXiTilvO6JcKaFIOy5Qs9RucNJZNeE1hT7Gf
 v5XnOEDLNwLu588WeDrVzFeVCRK/
X-Google-Smtp-Source: APXvYqzpZCFvrz/0mwKmJvUQAuTtF/gCbuVkwpmbGNWppkX3y4qVcal9Fq6as/3C3jf+fT0+s7kcTw==
X-Received: by 2002:ac8:7519:: with SMTP id u25mr31404108qtq.128.1566426283848; 
 Wed, 21 Aug 2019 15:24:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/37] drm/amdgpu: enable VCN DPG for Renoir
Date: Wed, 21 Aug 2019 17:23:59 -0500
Message-Id: <20190821222359.13578-38-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjWbseaoN5dvEjuV6y0tPmETtvFtfV092Ylhw/3DSEA=;
 b=bh6omH6zz5K7rAYDCM5nEmhGCYGVhNMlJ/Zb06ikStflLFx3AdMmf5CSELZPQI20u7
 +eKn0zUqPWl69aLBmm/UYGkytArsEK5a9ei5X3o2RSfbkz/dNUBWvENca/DbkPbr3KR5
 AGlqjHYSgVkm9i6RxdgE+YUovtQPZSq+I/76g/pimM7ozlI/ydUYOeUVqp5V7Ax+DGQV
 Suu4gcRXTwMWFnH/4bHTkKzyJ0qOCcjsnc3XSANm4ZCjkGM9Cojb4l7HaaR8O3qZReXw
 aZ/n98BUZjNXjqOJkh6u42gX2YBqh9wUBT6sjxK5xbmr9x1qr4xbckV1m6fdJVIY2TXL
 eyAQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Thong Thai <thong.thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGhvbmcgVGhhaSA8dGhvbmcudGhhaUBhbWQuY29tPgoKVGhpcyB3aWxsIGVuYWJsZSBp
bmRpcmVjdCBTUkFNIGxvYWRpbmcgZm9yIFZDTiBEUEcgbW9kZSBpbml0aWFsaXphdGlvbi4KClNp
Z25lZC1vZmYtYnk6IFRob25nIFRoYWkgPHRob25nLnRoYWlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCA1YzIxMWZhMDMzMjgu
LmZlMjIxMmRmMTJhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMTczLDcg
KzExNzMsOSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRs
ZSkKIAkJCQkgQU1EX0NHX1NVUFBPUlRfQVRIVUJfTFMgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9B
VEhVQl9NR0NHIHwKIAkJCQkgQU1EX0NHX1NVUFBPUlRfREZfTUdDRzsKLQkJYWRldi0+cGdfZmxh
Z3MgPSBBTURfUEdfU1VQUE9SVF9TRE1BOworCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQ
T1JUX1NETUEgfAorCQkJCSBBTURfUEdfU1VQUE9SVF9WQ04gfAorCQkJCSBBTURfUEdfU1VQUE9S
VF9WQ05fRFBHOwogCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDkx
OwogCiAJCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZGX01BU0spCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
