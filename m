Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C475E48F2A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C29189B83;
	Mon, 17 Jun 2019 19:31:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989F89B70
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:16 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so6968647qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jhAM/+jjtrUSJFTxApfpok6DpY2gB+Gjw8yjlTf1CM=;
 b=qAjZeUMEMaUmdtPABLBTHlPOQkSq46wBmV3sCnAAKhgIGLq/4uuOuY0u0DY3s4qn66
 QCffdI0L2hf4Snk59lynSTu2E0JPmCV1QuvuiXeLDAtWJcAnh66IaP9ZYgzqgbBZOfT5
 uIHy/s/9HxXHqC28TvFu7Wwm/6NjlH3pRsDq3kCGmDzA22VWntdXaEUB8CYWWlzsr9P2
 xdVG4rOh9FtOVyuayBtUXdQ8MOj2aj1b8jyzS1cgPJowlTw7q3AQ9lcPwtPZRKMo4vwp
 xq0LiDwRIsGAw5+ijHXRic5aYWSjtfU9UujIvJ/lgDFdz+qYoDuwg1qEoW8mBbgoZk9U
 Nd8w==
X-Gm-Message-State: APjAAAXoq9+sVFcuHZ++ovZlBXXN4HPnFksfsbygnVFukCdBBCKE9iMb
 BFcnRBf3g+EjL8BazceXhjQQ25mXR8E=
X-Google-Smtp-Source: APXvYqz5LmfKcpzUIVypc/lKuU0m7QvtjCtSG+263tAzfq+jykS8+KYNd23Bwci4XiDMI/CMz9G46Q==
X-Received: by 2002:a37:b87:: with SMTP id 129mr71701437qkl.132.1560799875477; 
 Mon, 17 Jun 2019 12:31:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 202/459] drm/amdgpu/gfx10: adjust GDS backup size according to
 real size
Date: Mon, 17 Jun 2019 14:29:29 -0500
Message-Id: <20190617193106.18231-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2jhAM/+jjtrUSJFTxApfpok6DpY2gB+Gjw8yjlTf1CM=;
 b=ICZkArHBdpUnauyaXSWu0OMXXDYsA2wG+7XHMobrj7GG0F364IoRbu31RNiQn9y3fd
 1iv9/Ekj/y9nG6db2qjZLwmHcGoMhx7Pjdwr5g7UzNneFzlysc34yps3JbHA4rTYNIN3
 Vmubp5zLUfQwm2W4XkmRyNGK/E4Ov5UqSMQUJDjO7x9ZStPJleWjj7VD8kxdpf599cdI
 nsxGmVvswRjCIZF4ytZZPX0GtDGQv0gtodDQk1rc59sCR4lUYG8QTGgQLI2UwbMTbiTV
 Rfmh8pM7R2KQ/Ih12XklYfwz2Fn6MlsYTFLg7K66dN80bKaqGLA9dMfQsy/MdOMXlbcg
 fZJQ==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFkanVzdCBHRFMgYmFja3VwIHNp
emUgaW4gbWV0YWRhdGEgYWNjb3JkaW5nIHRvIGl0cyByZWFsIHNpemUgaW4KY2hpcC4KClNpZ25l
ZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YwppbmRleCBmYWUwNzYwM2UxMjEuLjAxNDY5N2Y2YmQxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQ1MTIsNyArNDUxMiw4IEBAIHN0YXRpYyB2b2lkIGdmeF92
MTBfMF9yaW5nX2VtaXRfZGVfbWV0YShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGJvb2wgcmVz
dW1lKQogCWludCBjbnQ7CiAKIAljc2FfYWRkciA9IGFtZGdwdV9jc2FfdmFkZHIocmluZy0+YWRl
dik7Ci0JZ2RzX2FkZHIgPSBjc2FfYWRkciArIDQwOTY7CisJZ2RzX2FkZHIgPSBBTElHTihjc2Ff
YWRkciArIEFNREdQVV9DU0FfU0laRSAtIGFkZXYtPmdkcy5tZW0udG90YWxfc2l6ZSwKKwkJCSBQ
QUdFX1NJWkUpOwogCWRlX3BheWxvYWQuZ2RzX2JhY2t1cF9hZGRybG8gPSBsb3dlcl8zMl9iaXRz
KGdkc19hZGRyKTsKIAlkZV9wYXlsb2FkLmdkc19iYWNrdXBfYWRkcmhpID0gdXBwZXJfMzJfYml0
cyhnZHNfYWRkcik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
