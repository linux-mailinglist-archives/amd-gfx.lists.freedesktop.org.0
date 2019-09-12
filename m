Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB2B0C6B
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 12:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F360A6EC0B;
	Thu, 12 Sep 2019 10:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5168C6EC0B
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 10:15:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l16so27714582wrv.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXBs9Kx3Sy1ICblQwI9q3fRUc3wtdJRk2Ow1vbq3gvk=;
 b=dl2ZKYe95JI5iyhAyTaLcZS8eLoQBQMjbhUfoD2qFih1Beca4LNiM83+HQf7pY43Xy
 UrkPp7nq8ofSddk1dPs6+mbI+8R5iSRGI/DKLaLShj/usSnR7CifBXD4Faz+PTQMXFgT
 bs3m0kGPo+5omDjbwAXVThoGfydI9OrkP+SWONSZX+A2q+9pcXgQax4RHkTykpsNSszK
 gquLfGUmpXc0rUF647mQAkDB1I5iW6bPmK6+IGFj0vSTN8/Li1Z8p286r/6T5BNEJWcY
 SGeoYV0XZbWDfPOfW6fVfQ1mo8kTU/KEFrRMvyhXpxpNwq+jXttfCBGK86OlFMSR0J3q
 BASQ==
X-Gm-Message-State: APjAAAVljqMf3hdBuDpvw5P80xD0P+9t7UXhfCNXHVxCihSdR1KMcuOx
 pObZZ6cg03doR8MXp5ypClDBJguD
X-Google-Smtp-Source: APXvYqzNn6iBod+f/x25vCkyqsVhjP4jRrhlpEGVeVZKbo5DxxRufJnKsFc3250XXNNuA/QlA82vzg==
X-Received: by 2002:adf:f502:: with SMTP id q2mr7838513wro.186.1568283337731; 
 Thu, 12 Sep 2019 03:15:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f8cb:a5e:cc80:8969])
 by smtp.gmail.com with ESMTPSA id w12sm36947794wrg.47.2019.09.12.03.15.36
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 03:15:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: resvert "disable bulk moves for now"
Date: Thu, 12 Sep 2019 12:15:35 +0200
Message-Id: <20190912101535.71686-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXBs9Kx3Sy1ICblQwI9q3fRUc3wtdJRk2Ow1vbq3gvk=;
 b=ghlHPF5J6IgAnVlh6K9UAD/DZFX50C1y22o9+ZrgAr+C3ltsSsb+QYQpGa6BjF20bK
 rutVGRaHTBoMaEB3jG9u+DticDJ1Lw7W/qUe1bsMREeACMNGSY9F+knzzBmOiJWkB3pk
 yk8Vnkk0H50kYjvwD/bAN2g1n6eA51ycODOp/F9jP0ODcxRq1fElDgOXSEjhm9jZIS6o
 dZMlzSoSh5nnqHmgSn1m1J6dWM3ZRe03w4+eD4LW2WWRsswCZ4TpBiazUnj25pKWf7dc
 CSuEodNMPEHkzVpTQ5pnwY3GvL7eqL6LWmqrHJKU4bIHaZ6uuFmnAIWF3okpPa7wABgr
 T4IA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBhMjEzYzJjN2UyMzVjZmMwZTBhMTYxYTU1OGY3ZmRmMmZiM2E2
MjRhLgoKVGhlIGNoYW5nZXMgdG8gZml4IHRoaXMgc2hvdWxkIGhhdmUgbGFuZGVkIGluIDUuMS4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKaW5kZXggNDgzNDllNGYwNzAxLi5mZDNmYmFhNzNmYTMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC02MDMsMTQgKzYwMywxMiBAQCB2b2lkIGFtZGdw
dV92bV9tb3ZlX3RvX2xydV90YWlsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXN0cnVj
dCB0dG1fYm9fZ2xvYmFsICpnbG9iID0gYWRldi0+bW1hbi5iZGV2Lmdsb2I7CiAJc3RydWN0IGFt
ZGdwdV92bV9ib19iYXNlICpib19iYXNlOwogCi0jaWYgMAogCWlmICh2bS0+YnVsa19tb3ZlYWJs
ZSkgewogCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKIAkJdHRtX2JvX2J1bGtfbW92ZV9s
cnVfdGFpbCgmdm0tPmxydV9idWxrX21vdmUpOwogCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOwogCQlyZXR1cm47CiAJfQotI2VuZGlmCiAKIAltZW1zZXQoJnZtLT5scnVfYnVsa19tb3Zl
LCAwLCBzaXplb2Yodm0tPmxydV9idWxrX21vdmUpKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
