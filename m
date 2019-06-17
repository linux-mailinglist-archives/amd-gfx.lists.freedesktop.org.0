Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8948DCA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9811C892C9;
	Mon, 17 Jun 2019 19:17:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D9892B4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:21 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id w17so5767992qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2IS9Md9uRIETTTq0vEhYykkiZY4wlDgMXoDpmYnO2Q=;
 b=YrRqs2ALQ+5/ygmNvPOt5czu18a15bLlnd8ymEcVmmSHf0QfeE85l3DToyU7MHg6ar
 nbdOu2AjwPme7rvlvAcF5/W8XdzwBnPt5reysr3P3aj/8oyzFY9FGAppYUZwVQotjXhQ
 upZeL7mTXGQYwXFmts8IGwDSXLAygelLkYrSze3S3c/a8NhSKdaVR+tF7KAn7ZBtrmSJ
 /p2Xt4LwddC8kgE9c58AA5fbbXxWguf5I1o3bXQ/HkE2tZ2O9EorW5DY1kNB1a73Y6ps
 jaz/m5Nj4byzf4+IIZzRAfx5d8f2x4oL0RnzAdUNn9tLEF/vwK7zZM44C5IXwU+CDKRS
 2/bw==
X-Gm-Message-State: APjAAAVVKxCZxt80J+Qo+TbH4+LytiPj93VfAQPk+Q4fJ7mzyN7sZPL9
 qxbcL2EizCm4G2EOLFpd8fIwxdAXQ7A=
X-Google-Smtp-Source: APXvYqyONReEeyT4sxcYMqFi4s19olfGVX2fHXKvpwp3TvlFlIyKq1W5BVhw+btsMoGj1E3VVd+OCw==
X-Received: by 2002:ac8:929:: with SMTP id t38mr6999804qth.287.1560799040361; 
 Mon, 17 Jun 2019 12:17:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 018/459] drm/amdgpu: add GDDR6 vram type
Date: Mon, 17 Jun 2019 14:09:39 -0500
Message-Id: <20190617191700.17899-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2IS9Md9uRIETTTq0vEhYykkiZY4wlDgMXoDpmYnO2Q=;
 b=luw5wxWZ7StsHuuEN34YyJ7OaLkOF9Q9ZWc/USxu+c0Mrp4kzztANYVIc9brDu9q5S
 r64PLiFp1KYaS4bC/sbN6gA4EV8VQuSGK3sJsAI6w332vfbatlJtrK9/P/ntEIeZnJQr
 QvFyYbnUayiflQPRpY019wtDo4Nwcb7qCfzPDWkhlJl35tngpfwVz5BYleu5gmgSbkqI
 Ld/32tAzaoHHp5gcs7RXPOM5Jy5LXMphQUaHODiK7Pa3A7U6hBvp8FYtM+nd7ac9aYEG
 2pbTU0oKm2z/2YAzQq+HX7d2llpQ9TQKpS6pPaZBRx4SZYiR3/pVm/hXqUCGP7bdRe3j
 wyHg==
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
dWNoZXJAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRleCAw
ZjVlY2NiZDUyYmEuLjM0NGMzNmU4OTkyMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9h
bWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTkxNSw2
ICs5MTUsNyBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2Zpcm13YXJlIHsKICNkZWZpbmUgQU1E
R1BVX1ZSQU1fVFlQRV9IQk0gICA2CiAjZGVmaW5lIEFNREdQVV9WUkFNX1RZUEVfRERSMyAgNwog
I2RlZmluZSBBTURHUFVfVlJBTV9UWVBFX0REUjQgIDgKKyNkZWZpbmUgQU1ER1BVX1ZSQU1fVFlQ
RV9HRERSNiA5CiAKIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm9fZGV2aWNlIHsKIAkvKiogUENJIERl
dmljZSBJRCAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
