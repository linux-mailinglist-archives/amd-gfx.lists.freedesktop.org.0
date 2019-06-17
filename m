Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9548F7D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3F89CBA;
	Mon, 17 Jun 2019 19:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57289C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:11 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x47so12196330qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkk7DGlgGaiMDz0YdG8F/bQSMPS7+snJtNk3bdMRFn4=;
 b=G7wvEF2EZzwNG9oD9GzALekAhGLWbPtMaxg5RtVl0ewfZfPZHVVYbIp7Afs+mdCjdg
 AFGlnMTuAGS0GblJJpdYvU+Y3lNb3VOZjYgW8XSD1O3JZhdfilUiwkU6ucHZLUDdvjAh
 FlDgxGct9Foor7wEqpb5v1OqG0NrQhXaErDg8g1ypcl0GZGZo3JymDeW0bn5pD8/0lGc
 001hEit96IMUPkc6zvFKbVP/AYnql+/GcQ02hTvXq2SMIJCPb3o3uzFwdYpXSuevVmG6
 onJx58qZ0unVO6DDVM3kXzMJbUmCFzEixrcLCuIwW6uvl/fyRDxPKhq+ij+0kXte0q4B
 +CeQ==
X-Gm-Message-State: APjAAAWVS1NbkvqU/ENct+Fg2iTuzLsDD4QDonG32uBc5qe+PHEJdEmU
 KlWihhW8LQZg0kZTxuLWywoGfWTrOPE=
X-Google-Smtp-Source: APXvYqyGwub3KnYyqKbzX0Bg2ZwRRJ17OdVQkLxApYRvKC4RsXShF+zX6PKH7nXuN5b7yj6J+3r8Xw==
X-Received: by 2002:ac8:2642:: with SMTP id v2mr28574269qtv.333.1560799929847; 
 Mon, 17 Jun 2019 12:32:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 262/459] drm/amdgpu: correct reference clock value on navi10
Date: Mon, 17 Jun 2019 14:30:29 -0500
Message-Id: <20190617193106.18231-63-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkk7DGlgGaiMDz0YdG8F/bQSMPS7+snJtNk3bdMRFn4=;
 b=dR5gIOJq4ot8iA4S+SrgQtkw5lo64XR5lkizqvFBQDu69x2xqeyrVHqpJ599CMqyTR
 twzfVeK7msDdTmMLhfJXyT6ma+Ez32bVeTI4a7ivYiA3oLTnNo6DbTaoh1Z8aD90MA0t
 /Yl+Lj1PqSaUueRAXuJYru5PInYwUti6yvmIuHuBBHKVO9jPNEEONL6+biQ3KSx6vD8L
 wuaNb+MKEtX0B6MqsQLk89aN7usVRf0rmP2jwwQ9oAOtKtiULCMQLrgBRxbFkzLhAvlR
 fuunYx5XkI+IBaNTN8H/wuxEGH/rfmFpjIE9dhJVatJlj2s9eb07ao+I9l4obwOPbzLt
 6tEw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKcmVtb3ZlIHRoZSBkaXZpc29yIDQK
ClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KQWNrZWQtYnk6IEph
Y2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9udi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXggZDFmODc1N2FiYmViLi43MGQ4NDRkMDZl
MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtMTIyLDcgKzEyMiw3IEBAIHN0YXRpYyB1
MzIgbnZfZ2V0X2NvbmZpZ19tZW1zaXplKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiBz
dGF0aWMgdTMyIG52X2dldF94Y2xrKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCXJl
dHVybiBhZGV2LT5jbG9jay5zcGxsLnJlZmVyZW5jZV9mcmVxIC8gNDsKKwlyZXR1cm4gYWRldi0+
Y2xvY2suc3BsbC5yZWZlcmVuY2VfZnJlcTsKIH0KIAogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
