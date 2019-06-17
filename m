Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C6A48F9B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293489D61;
	Mon, 17 Jun 2019 19:33:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4834D89D58
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:40 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so12233841qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xd+3gxldF/GWberj9DJpXQYQS3SOQcY7ykKri2XiLQ0=;
 b=LNwoCtO0Ca1jwv0GYTexeWUILtOPcDG+lhdYPvwRIJ5dLiufzLPZKdN5XdRqK81xni
 DoNZrL19rVVnxJ4PK2DYU9DDPKDc6ad32ZRFDtjPqrT3PUnnHVOsrg9agFiQvjY/OLQf
 LRlRrpjcguJr0qviOgVOkDpw5nnGBN4gwkdX/BylNkJzAOGI5a9Gi9Ma/Q9HndKbqcZ6
 CDigB3ZDXax/UDoG2ILzAPPd6oqQWcfDmk805VmKGirgzYT75B6Y8okX6m/5OIOmNkN6
 o4rIyhniHjZkNNz7LraHObb0F+5vrGpsgUfAQ4dnB7Odco3VO7FsloZx1zBuJA715wI9
 0M0Q==
X-Gm-Message-State: APjAAAVOppG6IpB0EntLsJEFS8Stovj7e/GXy1eE5/bbM9+/YTIcNAJZ
 exqt+hucsVrb5qrcOMjSFcW7zr0V0xE=
X-Google-Smtp-Source: APXvYqyyUDFOjLnC3ScGc8do2JriBMCwOpCgHxk6023BqHENFDTi9J+sodIlC0GbFpl4rRXwpz48cQ==
X-Received: by 2002:ac8:24e3:: with SMTP id t32mr20275307qtt.104.1560799958384; 
 Mon, 17 Jun 2019 12:32:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 294/459] drm/amdgpu: add corresponding vcn ram ucode id
Date: Mon, 17 Jun 2019 14:31:01 -0500
Message-Id: <20190617193106.18231-95-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xd+3gxldF/GWberj9DJpXQYQS3SOQcY7ykKri2XiLQ0=;
 b=d6xhxgPvHBMelUItxQejnLJLJoQjE3EZVVgQ0h0y74SoVucf2QwexZQHDVVrA3sAA8
 Spr32pr383/7ge4PUOhtArxdyHxg4w/e1mK/jZ6c0kE66XovOYWH3E/wjkTC5ICJuQfF
 ad3tOEt9mUiwFBDm0YJ7QwaiB0nfJ4j1ksZhH/r32AeP0S1cAqgs2BoHkXwp/cp2xZ4B
 tfmoMIR4EFk7dTUj3ywRNUIt6CxiYzL+2zrf1NA0XdlRWqyAgLQYMwrdXF6U1nI5Ksb0
 +RGUUcsqn5wFXXB0051U6MhYSgOFnXU5YYh/OtTb4/Yvzd8FN4BO1FLS5wAtuVD+2bQ6
 /avg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFkZCBWQ04gUkFNIHVjb2RlIGlk
IGluIGNvcnJlc3BvbmRpbmcgdG8gcHNwIHVjb2RlIGlkLgoKU2lnbmVkLW9mZi1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91Y29kZS5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXggMzc4MTBlMDczMDRl
Li4wN2YwMzU5Mzc2NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91Y29kZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29k
ZS5oCkBAIC0yNzEsNiArMjcxLDggQEAgZW51bSBBTURHUFVfVUNPREVfSUQgewogCUFNREdQVV9V
Q09ERV9JRF9WQ04sCiAJQU1ER1BVX1VDT0RFX0lEX0RNQ1VfRVJBTSwKIAlBTURHUFVfVUNPREVf
SURfRE1DVV9JTlRWLAorCUFNREdQVV9VQ09ERV9JRF9WQ04wX1JBTSwKKwlBTURHUFVfVUNPREVf
SURfVkNOMV9SQU0sCiAJQU1ER1BVX1VDT0RFX0lEX01BWElNVU0sCiB9OwogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
