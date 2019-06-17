Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDA48E2F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7E7897BC;
	Mon, 17 Jun 2019 19:18:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6838975F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:46 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so12175944qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2/mw6klwQuQf97bMTSSFeS+2fRfLFPRWrbArNwNz2kc=;
 b=ug2kS5s00NmmaEASly3ndfYiVAiTwW/FCPImCrQoKQ6CUmK+RioSIO2ebm5uKFT4yb
 U5Q6xbbSPQJdjSMzl68y2auO3CIr7wZXTbRWGmuPDFPMIHxoiAVLmZQyOnFZhuUWyFZ3
 D8uFZZAnHxLv6+aXRmcofWyQIDZ4JjbG5oSug46s/f4y5P21YfoAJpDKUuIAP1G02/N6
 86YUpOu+t5TFc/P0Qjok7bdR0NVSet4E8edmlqm9S/KtlFh0Aq9KbZcldJrvFgfvpRZt
 lCAw+n2RTIjkc3dSwHh1aa9e0sFhSH4S5BR9BpVJsXo/6BNf0ZmqSX50kIm16p3c1NPC
 Uz+g==
X-Gm-Message-State: APjAAAViMR+mfoanPlL8+haGbFXvuXMYnivc70GNz9D7/sRNofLb0M80
 bZMAME7z6TyfIMnESq908hq6x3Wuxgg=
X-Google-Smtp-Source: APXvYqyG5TltGKKx5xfd0YKngfs59Ln9YZyhoNROqDK81ouSKw82YdRgNiOFVY+D8mRgE0XpX9wPYA==
X-Received: by 2002:ac8:2225:: with SMTP id o34mr12166418qto.222.1560799124603; 
 Mon, 17 Jun 2019 12:18:44 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 109/459] drm/amdgpu: add pa_sc_tile_steering_override to
 drm_amdgpu_info_device
Date: Mon, 17 Jun 2019 14:11:10 -0500
Message-Id: <20190617191700.17899-98-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2/mw6klwQuQf97bMTSSFeS+2fRfLFPRWrbArNwNz2kc=;
 b=FaR9xMNUd9kQSNXpYxOj2eeZsWWdfMm3gCx9S9s86MgbOCN3eSSP5LeybAfNJTHxD/
 /MGO2CDdSQaL5/W1yvyPo6sRy17wZsAbKZ+BHeuV6O4b+dfp4+Hd3KS3z+wiEcW8kskC
 cnJOv6n5K+c7YysbQ+7DxQZxEsR2GKS39SBmmZMXhATxg+e6+Rqm2QyxVFtiAfVu08za
 lbKczGj/sy3GHh1OS3nuknMPuKayAUiAxfE4XYj287yKWRDgvoq0ebg6mb59AgSOQOzX
 gy28HfIO6xgz+dLdIzTwTlF5NmY+gz4ZehH7oYdokbV3xEgJEgLH0uOenNlPnqsjjGyU
 gr2g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdGhlIGluaXRpYWwv
ZGVmYXVsdCB2YWx1ZSBvZiBwYV9zY190aWxlX3N0ZWVyaW5nX292ZXJyaWRlIG5lZWQgdG8KYmUg
ZXhwb3NlZCB0byB1c2VyIG1vZGUgZHJpdmVyCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5o
CmluZGV4IDM0NGMzNmU4OTkyMy4uNjE4NzA0NzhiYzljIDEwMDY0NAotLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaApA
QCAtOTk1LDYgKzk5NSw4IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm9fZGV2aWNlIHsKIAlfX3U2
NCBoaWdoX3ZhX29mZnNldDsKIAkvKiogVGhlIG1heGltdW0gaGlnaCB2aXJ0dWFsIGFkZHJlc3Mg
Ki8KIAlfX3U2NCBoaWdoX3ZhX21heDsKKwkvKiBnZngxMCBwYV9zY190aWxlX3N0ZWVyaW5nX292
ZXJyaWRlICovCisJX191MzIgcGFfc2NfdGlsZV9zdGVlcmluZ19vdmVycmlkZTsKIH07CiAKIHN0
cnVjdCBkcm1fYW1kZ3B1X2luZm9faHdfaXAgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
