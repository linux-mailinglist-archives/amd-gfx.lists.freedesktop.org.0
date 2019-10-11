Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEAED3753
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287526EB9C;
	Fri, 11 Oct 2019 01:46:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5856EB9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m61so11644125qte.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=knNmRDlFeLG4FR6Wx+USswh8RvkOX+WtMuanxOYAu9Q=;
 b=BmifFD/1+NzIQUqk53A7HYmrOeTaxoxH1M9KlYKojEJcmik/biXh9gi5/soNKbiROB
 DV6W5W96fK17DxYZcotJ3kJ1RQWdIzAQNvIJlwGxuPHLNUpY8QiZIbXm+wFG52if8DAP
 B0TnSrdhtK5Eg9xoR05TwAvcLtAXqmERPSxU4TntG8XmQ0Sq+L3JQGuwP48QoISEHUPr
 wcJU/6WINKUi64ieuiQfg5ZuntBsHLltw4oJdvneIJB3/YmIH6Z88wKtjJCrdN4koePf
 IXVqIG8DB7xthEbx0Zj5sF1BnNekMpzYFz5f6FnVdjL6a+Y0SEkAwzJuy0ezqxXrhEPv
 g4mA==
X-Gm-Message-State: APjAAAUFJpc3IjoIgyVWml0/jvCSuKr5pSfgOnV4RH1SMZtvUTtTQGOS
 0TxFQGK0IpF7iRJYoResYmP9wzNn
X-Google-Smtp-Source: APXvYqxeVQ34jPaG1K3qG7Jq8QDP1mgImoBFCOA+YXa+dS6QADyGUXCwMdJIdneFigmI6YQiba4Sjw==
X-Received: by 2002:ac8:47c7:: with SMTP id d7mr14525183qtr.29.1570758360727; 
 Thu, 10 Oct 2019 18:46:00 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:46:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 16/19] drm/amdgpu/runpm: enable runpm on baco capable VI+ asics
Date: Thu, 10 Oct 2019 20:45:33 -0500
Message-Id: <20191011014536.10869-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=knNmRDlFeLG4FR6Wx+USswh8RvkOX+WtMuanxOYAu9Q=;
 b=ssMg1DFggeLwyr3/bK17O6TvZMFl3/1PlQLfTZVXVhr56jC2dUOYfbHIsTxIB9pNfS
 PspVG+gcM6xUCF+VjAcHhVpSat8/EMQ5PzmzAuccCQdtVudZssE611ejIhY7DmVQI+T0
 2rZpU0wOMCz2EmkUyMlj4Lq1vFZ37Nn/gjmSCbHGs5emg+rR6VAQlI3tqz1SANVLxoS7
 r+36ejjZGqFQfMFHNOtn4QlWjegvGV2h/1q6/x8V+DjkVfvto7nZzIoLFvIlWZaPN1FT
 5nTeUbP45++oOQE9Aenrk/N/MfaSVV5iWdY7cZY7pv7ZUADAu/1xCCjY1QK3xa4kGuZ7
 P0Sw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VlbXMgdG8gd29yayByZWxpYWJseSBvbiBWSSsuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2ttcy5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMKaW5kZXggNjNhZThmZDc2ZTUzLi4yNWNmNGRmNGY3ODEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMKQEAgLTIwNSwxMCArMjA1LDE0IEBAIGludCBhbWRncHVf
ZHJpdmVyX2xvYWRfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpCiAJfQogCiAJaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYm9jbyhkZXYpICYmCi0JICAg
IChhbWRncHVfcnVudGltZV9wbSAhPSAwKSkgLyogZW5hYmxlIHJ1bnBtIGJ5IGRlZmF1bHQgKi8K
KwkgICAgKGFtZGdwdV9ydW50aW1lX3BtICE9IDApKSAvKiBlbmFibGUgcnVucG0gYnkgZGVmYXVs
dCBmb3IgYm9jbyAqLwogCQlhZGV2LT5ydW5wbSA9IHRydWU7CiAJZWxzZSBpZiAoYW1kZ3B1X2Rl
dmljZV9zdXBwb3J0c19iYWNvKGRldikgJiYKLQkJIChhbWRncHVfcnVudGltZV9wbSA+IDApKSAv
KiBlbmFibGUgcnVucG0gaWYgcnVucG09MSAqLworCQkgKGFtZGdwdV9ydW50aW1lX3BtICE9IDAp
ICYmCisJCSAoYWRldi0+YXNpY190eXBlID49IENISVBfVE9QQVopKSAvKiBlbmFibGUgcnVucG0g
YnkgZGVmYXVsdCBvbiBWSSsgKi8KKwkJYWRldi0+cnVucG0gPSB0cnVlOworCWVsc2UgaWYgKGFt
ZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYmFjbyhkZXYpICYmCisJCSAoYW1kZ3B1X3J1bnRpbWVfcG0g
PiAwKSkgIC8qIGVuYWJsZSBydW5wbSBpZiBydW5wbT0xIG9uIENJICovCiAJCWFkZXYtPnJ1bnBt
ID0gdHJ1ZTsKIAogCS8qIENhbGwgQUNQSSBtZXRob2RzOiByZXF1aXJlIG1vZGVzZXQgaW5pdAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
