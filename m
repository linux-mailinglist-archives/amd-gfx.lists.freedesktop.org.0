Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F287EA9
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2731E6EE55;
	Fri,  9 Aug 2019 15:53:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF36EE51
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:35 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so726022qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bLdDJWkqZSriLoUP81qPe1OlGaXIICCD0BsQDWKnKMI=;
 b=HO8ZKcZ02FwkTpZJ0LEGzzvcexZU91n43Sau7qO3yg3OF7CkHZ6B9ppFljWhFbis+t
 dZlfqtyk0zkeBdiHPagt5i34vk1XBWZ1IHmw2Q3SC/cfc/y0EAGLw9fL+uyO5Tpn2850
 3XRrKSdYQtTOP+6RLtb2VqhGHqYMz1kpOarRc1JeO8igTy2265Di7SDbvrMYKqdyKJaS
 WKOMoL3A8kYJVQrm7qdnXbfpocQUY5Ocy6goEtsmuI51Oxw2v7u9mSWmjnUep8Td4aU1
 ORNtf0UO+1sIY/12Ut3lWyWhRtC7XHB/tjLnqU80DUHxJziBO3PwEamPdKN4y5Z/HPzc
 rS/Q==
X-Gm-Message-State: APjAAAWoa+JVpjiIabYVMGh5ma2gD4HjlIvUqZRAfArgjeCtPFsOF4SQ
 nqmpeqiCinZGnqH+m12qheuBYdVi
X-Google-Smtp-Source: APXvYqye1kcfbn7h2HHR9PQBnqZUpNRlWA0esef3K1AgPbOhDNHQNguEEjP1KvyiNTHBpLW+50h5SA==
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr11245062qkl.499.1565366014438; 
 Fri, 09 Aug 2019 08:53:34 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 27/27] drm/amdgpu: flag renoir as experimental for now
Date: Fri,  9 Aug 2019 10:53:02 -0500
Message-Id: <20190809155302.4733-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bLdDJWkqZSriLoUP81qPe1OlGaXIICCD0BsQDWKnKMI=;
 b=iiOjem3jl9vym/aWAu4JzFTt2Pk4PVfI9mQf+wQQ7nIGp48TI9YmU/BVB0hc1Oi0vQ
 HYXTI+YUDIxwl/zaNH87iZTx/irIv4fYG8q+qv65SfT2fGi5uILs8TdXDGFGswIKilkX
 42XBj0DubB2TUymW015noJYXqMuY14fLc+eYRYhggZIVKjOZB1yar20m5jL6AOYV6V1V
 GNeDQokvpAcFDVss2Kh0FVOT+PN2AV5vfLLkK69GtnfiE2l8WXOR1Xw8CcC/G8GJ1bxc
 nJvJrzacHYNzBhpKF1IWSMTwL0tDjc2Nycf218O7r9Nu962POFByBNexuPUwfaow3H/X
 kRKw==
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

VGhlIGN1cnJlbnQgY29kZSB3b24ndCBsaWtlbHkgd29yayBvbiBwcm9kdWN0aW9uIGh3IHdoZW4K
aXQgc2hpcHMgc28gbGVhdmUgaXQgYXMgZXhwZXJpbWVudGFsIHVudGlsIGl0J3MgcmVhZHkuCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDA2NzRjYTkwYzk1Mi4uNmVlNTI5ZDAxMjYzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMDExLDcgKzEwMTEs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAJ
ezB4MTAwMiwgMHg3MzQwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkx
NH0sCiAKIAkvKiBSZW5vaXIgKi8KLQl7MHgxMDAyLCAweDE2MzYsIFBDSV9BTllfSUQsIFBDSV9B
TllfSUQsIDAsIDAsIENISVBfUkVOT0lSfEFNRF9JU19BUFV9LAorCXsweDEwMDIsIDB4MTYzNiwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVXxBTURf
RVhQX0hXX1NVUFBPUlR9LAogCiAJezAsIDAsIDB9CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
