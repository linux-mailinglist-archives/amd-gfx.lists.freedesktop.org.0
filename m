Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4D87E91
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5D6EE39;
	Fri,  9 Aug 2019 15:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABD66EE39
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:16 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f7so3369235qtq.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVblfjEJSv3OoN5xLaSo5cx4Q2t+AhfYS5aZofYBGvg=;
 b=mBxXy4/26gTj2jEu81UD56C2c4eooG/m0S9yGk9QIYrP9X92vyCB2xaxDCNlXREahu
 WmMWTDeAjI2N0d9mdv5/ytuyZYr90/THbE9uwklvKBWuMnm/EJx0hznqXd7VzkUTwT5f
 1lgsiW15cC/q1xnHZbIm5dI9GWxA2LSo2Lk1He9v4l0BNBaLYs1fD6eqDipRT6MxNSVl
 SckpEpoRTUvNhEK9vOnypNX4zZLu+q5sOWe3ANgP6h1DtqQLHuMihFgcvU+3wlvsO4q3
 9iLFosQlZB+ewwbmxHu0ecvrRBLiC9yUdRZaJww0yyCQ+aKFvnO3nUBDn6z6bNFVTDYI
 sD/w==
X-Gm-Message-State: APjAAAVCXDWzuz0UsCJZq4SCwKZPEG5W0J02iS1pUO1oxeD+YZoU+ODF
 juiJdwjx2ueFvoAn0TY6Hgc6K40X
X-Google-Smtp-Source: APXvYqwIIWdNOZ+7RcPVu6+3einWZQkfukpsfNtzNeuurHwyI9t+wazheJl7Y2LPKeDjQgXwB6AxTw==
X-Received: by 2002:a0c:b50c:: with SMTP id d12mr18715264qve.70.1565365994994; 
 Fri, 09 Aug 2019 08:53:14 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/27] drm/amdgpu: set fw load type for renoir
Date: Fri,  9 Aug 2019 10:52:41 -0500
Message-Id: <20190809155302.4733-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVblfjEJSv3OoN5xLaSo5cx4Q2t+AhfYS5aZofYBGvg=;
 b=C4zhrpS0gAVI0h1MpEF9CCcA/UbGV/+DyTEbUc3X/7fWC8HjRKd/I2Ksv3V6vNnaPZ
 G4WniLKLZ/3QvhkulhLtcK1XI2F+UcQ/sgg9mWJGyi/aiyC7nmOv28V+/sVnxzlN902M
 bMqhwQSrJzrHlIwpAZBXeNOlKxDhSSUo1D2Fkn92x/0Ws0H7V5y6fg7lujF344Xmbzxk
 f8Apew2FTO74YbsD5dQ+1URf+mGqh23IfNB/djVpsiOA5i6sS7Cy5LSi6VST5uf+HaQq
 dCtsrOWbt7AiJU6tVHoZsah9HGF/Xpk2vDSe6+uAKsM2rEAFV65SvwhQ25ZR028kmgpI
 myVQ==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggc2V0cyBmdyBs
b2FkIHR5cGUgYXMgZGlyZWN0IGZvciByZW5vaXIgZm9yIHRoZSBtb21lbnQuCldpbGwgc3dpdGNo
IHRvIHBzcCB3aGVuIHBzcCBpcyByZWFkeS4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdWNvZGUuYwppbmRleCA2MTg1YmEwNzMwYTguLmY2YmNlNTBlMmIwOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKQEAgLTM2OCw2ICsz
NjgsNyBAQCBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgaW50IGxvYWRfdHlwZSkKIAkJZWxzZQogCQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX1BT
UDsKIAljYXNlIENISVBfQVJDVFVSVVM6CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJcmV0dXJuIEFN
REdQVV9GV19MT0FEX0RJUkVDVDsKIAlkZWZhdWx0OgogCQlEUk1fRVJST1IoIlVua25vd24gZmly
bXdhcmUgbG9hZCB0eXBlXG4iKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
