Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283EF72710
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601BB6E43F;
	Wed, 24 Jul 2019 05:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2B16E43B
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:25 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s22so32893457qkj.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03fM4BWUB065qzHbo76Z/RqNzb8eFXXDkmkZeXibR40=;
 b=AVHe0Qxe+9Mn6IxQgYfTh/lGYOtSFeA7WpdJov7dVK/0ru77mq+FYdZaME/XYq8LEV
 kBJzs4hoHnbgrnTK2FK9Egd5NMo+voSmJa3mafmjWRhwgdrGqb6pDg5rLBgClEvWagac
 viNeltiF3zchQiSrs1VtjtlUnRPgp+BDdTsysPTCXTYYxdRV4KbmagHwT4/49gbOYMK4
 cwlgNqRhMR6DP3rxFeV03mGui4REYFT5g5lQAvEsFfhyjkPUTVxImZpmx4zUf+U+VOV3
 4tEbAYEsnfdkpY4V4CFT89CR2Ee2DRyuGMD30sxgp7OuhftbGosyUcreA1cxaVtrxC/P
 AC5w==
X-Gm-Message-State: APjAAAXy+hmaWmoPKpIhaRJSSzg4lmDPxQKBxYLJvnI9vfF6HtGjf9ls
 hfEOk2nSkSNaD/lN+uNRokL3ELUX
X-Google-Smtp-Source: APXvYqx3AMeBKyPpxk4prC3CCT4qk1A8vBwx4jSh7vMTielFcLhoKo40KivXgQnTP+dYtbtDUh6kWA==
X-Received: by 2002:a05:620a:1393:: with SMTP id
 k19mr50933747qki.67.1563944424539; 
 Tue, 23 Jul 2019 22:00:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/9] drm/amdgpu: add reset_method asic callback for cik
Date: Wed, 24 Jul 2019 00:00:06 -0500
Message-Id: <20190724050012.31398-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03fM4BWUB065qzHbo76Z/RqNzb8eFXXDkmkZeXibR40=;
 b=nbrMC73or74nwz1odSCWsIKu7mpwT+F8/I6oe+OJPRh8umuvuHhW2+oyho3LRM+R6s
 cLVi6TSqMu3Z1SHXtAGa1ZmPS4dj/zylXR8XwVcICivqatWq8TDkSyYAejoCv2Qy2zHY
 QZNMPERrUc6CIzUC2fXVP8jIC2Epu6D1BF6fC3o4r/t8T5Wqgx0RUQVtSI5vBvx9BmC6
 qPVrGoZFDSnU7tiV1MDbwWmuRi7iRg6FTY9x8IYRAmj4gjuqeEnr57Yz3HiBn2a7FOKG
 Pw2yN5g91sx0lPhiH/0q7lfoZkKNi+yLSc5quSNOcGNmyExxo9siVgLfSomcZhbvndmL
 ENiA==
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

Q0lLIGFsd2F5cyB1c2VzIHRoZSBsZWdhY3kgcGNpIGJhc2VkIHJlc2V0LgoKU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lr
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYwppbmRleCAzYTRmMjA3NjZhMzku
LjdiNjNkN2E4Mjk4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lr
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrLmMKQEAgLTEyOTAsNiArMTI5
MCwxMiBAQCBzdGF0aWMgaW50IGNpa19hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCXJldHVybiByOwogfQogCitzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCitjaWtf
YXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJcmV0dXJu
IEFNRF9SRVNFVF9NRVRIT0RfTEVHQUNZOworfQorCiBzdGF0aWMgdTMyIGNpa19nZXRfY29uZmln
X21lbXNpemUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJcmV0dXJuIFJSRUczMiht
bUNPTkZJR19NRU1TSVpFKTsKQEAgLTE4MjIsNiArMTgyOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYW1kZ3B1X2FzaWNfZnVuY3MgY2lrX2FzaWNfZnVuY3MgPQogCS5yZWFkX2Jpb3NfZnJvbV9y
b20gPSAmY2lrX3JlYWRfYmlvc19mcm9tX3JvbSwKIAkucmVhZF9yZWdpc3RlciA9ICZjaWtfcmVh
ZF9yZWdpc3RlciwKIAkucmVzZXQgPSAmY2lrX2FzaWNfcmVzZXQsCisJLnJlc2V0X21ldGhvZCA9
ICZjaWtfYXNpY19yZXNldF9tZXRob2QsCiAJLnNldF92Z2Ffc3RhdGUgPSAmY2lrX3ZnYV9zZXRf
c3RhdGUsCiAJLmdldF94Y2xrID0gJmNpa19nZXRfeGNsaywKIAkuc2V0X3V2ZF9jbG9ja3MgPSAm
Y2lrX3NldF91dmRfY2xvY2tzLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
