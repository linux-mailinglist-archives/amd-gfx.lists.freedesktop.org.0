Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADBE48EF9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B7B89AC6;
	Mon, 17 Jun 2019 19:28:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926E89B18
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x2so12261970qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9Io5xZlKjHh7eAhUZz96N5soetjiqNDdl5zXjCBd5Y=;
 b=XDhS3caMXcJcHtF4hUrasp35tPao57b3wvmUWCjCG1N0tMFG7O5OwZ/nVLwn+G7yqM
 MkcpQWQmwE6T+k6bdNaOJnLwX7tBdLKxaAF+TshxaaSHiWH83i2xYVRjHIa2qPsk/mDa
 q3F/8AFZ1ZaAsPzbt9prQwswCg9VK9CGxEGrfNBDxwkGASUMAxDqmcj488NCblrR3CHD
 n/7lGkvv/sVUujeHXUniZTXvWmbbWVtQzqtAo9tRD1LYRxhUDrnA+VQPjPI2X5w9pJ9/
 97pEX91hmTN8BDp95uv+JSDKsY0rTfaTppcE030FlaU2U8irpHYsMjVM50Hn4D8oxDsg
 OMSg==
X-Gm-Message-State: APjAAAXzwfOpfSAP0aY+ZA7YjxBS2/jDnxtInls9TGyTNZ734yyP1sRx
 LSmRzRny3PGobXSLhiNFExi9aWKQz6o=
X-Google-Smtp-Source: APXvYqwYOxEtPp2L43jY5lYXJeNJiE/Fddkp0amr7cYEDF3NDEZ377sZfkwYfKtlwVsJfzA28p8RTQ==
X-Received: by 2002:ac8:21f2:: with SMTP id 47mr82307238qtz.38.1560799715436; 
 Mon, 17 Jun 2019 12:28:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 189/459] drm/amdgpu: disable some gfx light sleep
Date: Mon, 17 Jun 2019 14:26:54 -0500
Message-Id: <20190617192704.18038-90-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9Io5xZlKjHh7eAhUZz96N5soetjiqNDdl5zXjCBd5Y=;
 b=BysXJ3aqC2If4CotdqbGXg8e1quRLUjFd1Hc5U708CqEF8C/b7AkkbsuHxXGnSQ228
 qwWxgcrDL2IfRxa9vtT6hAXUw54YdLHbsQcBZhxPhcd0CKYEeZhjUR9Ft36axwq7E2r4
 D2Fsmb6unuYxzm8uDahGdtRr9wMWUzKOy4IPHKDfDQPDPiftg9psmD/dbBU5UdkTEWv2
 bOEHdkWywTcboF696CH0nBvDU7Y8B4wNl+4ZIYxA5IPm8Y6EJGu2VmjIOWMdqNN1+Cgc
 SsagwLDVp3ODz7v/rhP8e8/pc0Q8cmjBwBsB5hpiGscfP9VhWftUrPQkfBAjZ9HpOtOt
 Eeeg==
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
 tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCnRlbXBvcmFyaWx5IGRpc2FibGUg
dG8gYXZvaWQgczMgdGVzdCBmYWlsdXJlLgoKczMgdGVzdCBmYWlsdXJlIGxvZzoKIltkcm06YW1k
Z3B1X2pvYl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiByaW5nIHNkbWEwIHRpbWVvdXQsCnNp
Z25hbGVkIHNlcT04Mjc4LCBlbWl0dGVkIHNlcT04MjgxIgoKUmV2aWV3ZWQtYnk6IEphY2sgWGlh
byA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpYW5jaSBZaW4gPHRpYW5jaS55
aW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmlu
ZGV4IGEwZDE5YjlkMzI5Yy4uNWYwMGVlZjFiZTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
QEAgLTQ5MiwxMCArNDkyLDYgQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lk
ICpoYW5kbGUpCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEw
OgogCQlhZGV2LT5jZ19mbGFncyA9IEFNRF9DR19TVVBQT1JUX0dGWF9NR0NHIHwKLQkJCUFNRF9D
R19TVVBQT1JUX0dGWF9NR0xTIHwKLQkJCUFNRF9DR19TVVBQT1JUX0dGWF9STENfTFMgfAotCQkJ
QU1EX0NHX1NVUFBPUlRfR0ZYX0NQX0xTIHwKLQkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0xTIHwK
IAkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JUX0lIX0NHIHwK
IAkJCUFNRF9DR19TVVBQT1JUX0hEUF9NR0NHIHwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
