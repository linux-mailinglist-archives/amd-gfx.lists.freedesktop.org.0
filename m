Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4048E03
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F7889533;
	Mon, 17 Jun 2019 19:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E5D894DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:07 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c11so6916353qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAKmoxac1mYESroot+407I2aq4745bhz1WlYLyEYJ9M=;
 b=JZICswMwT76/yn0/2w3VAicZZpydqj3uLUW3VHXZbOVfODEqyrCSRMfyLrJgXz2Zdq
 MfBwUpey8j0F3vC8m+sErjEgEtAWl2foPtWjwSZ9VYHbtLv0aMfSbwDnKkGKXQyETLa9
 w6yM0eDaw3tlBzy0JWs7otNlxxtYWkGs8iM8hDRHrMC0dvqNH+qYj4BZLtjmIlx1sfl6
 wDtBa9D3wx+YXLSL8Vdavf24tfp8froKNFk+BjMaLFDa4oHLIeaHYthPDIt4ybzoDxzI
 5XSycHk26tHKBuEVL+ZXGRp4Mm5A5HZvxiPxfpE0YdqLWd6MuMHYxoxq1jd+SSiBQ5oy
 P7+A==
X-Gm-Message-State: APjAAAXEcoiZS1dyvOSvYxrDK2OP8b1dWVsbTUfJQrPnluTyFJW8sukm
 1CMybzFA0+SnWxH4sVbdHaTZm3JqUhU=
X-Google-Smtp-Source: APXvYqza7cZT1rYQ/yLkQz6VHBnZhX8T4KQ+Eayr71xwCJ/qJQ95yFhTlm36pk1pqJxF1UyQbn77fw==
X-Received: by 2002:a37:624c:: with SMTP id w73mr386321qkb.139.1560799085538; 
 Mon, 17 Jun 2019 12:18:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 064/459] drm/amdgpu: set navi10's fw loading type as direct
Date: Mon, 17 Jun 2019 14:10:25 -0500
Message-Id: <20190617191700.17899-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAKmoxac1mYESroot+407I2aq4745bhz1WlYLyEYJ9M=;
 b=E/N4dAJBvFwGA8G8P1zg1LVPOZRDjz/oycOrAB+4z8dKvAOMXM7uykrLTbQ+wjjRGH
 gYh4WgVqwmQ0nTmJkuaj3/wR+QjiL+CeFbG2golZ1dnZ+7e+A1jC+F7oUWeL0aBA5u8/
 63OfKl8IGX78IGR7UriOSPonWpwAUGnzis7TxI9ZrQWAGrCsvtb5/CtJeVFeTJIJTA8B
 j3VBn7V4p9999+DM6Ags03Sp6lbIkjPCNW+TL867C4sBx6HdEp2I47mZNTrPh1T0FV+0
 oNyL7ejeZyBIawKzVLYKzHY65wQp9nhpUPjiPQk+KM8uQZuE6wbO7/tjqVMyMXwP2d+W
 O2og==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNv
ZGUuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCmluZGV4IDMzYzFlYjc2YzA3Ni4uOWY1MGQ2
NWIzNTBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNv
ZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwpAQCAt
MzA2LDYgKzMwNiw4IEBAIGFtZGdwdV91Y29kZV9nZXRfbG9hZF90eXBlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQogCQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX0RJ
UkVDVDsKIAkJZWxzZQogCQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX1BTUDsKKwljYXNlIENISVBf
TkFWSTEwOgorCQlyZXR1cm4gQU1ER1BVX0ZXX0xPQURfRElSRUNUOwogCWRlZmF1bHQ6CiAJCURS
TV9FUlJPUigiVW5rbm93biBmaXJtd2FyZSBsb2FkIHR5cGVcbiIpOwogCX0KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
