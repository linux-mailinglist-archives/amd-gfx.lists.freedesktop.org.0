Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7A48E01
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49DD894E7;
	Mon, 17 Jun 2019 19:18:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECF1892AC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:05 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so12173187qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H7dDyus8Jtq0taOc4PrmHpSD2ECCsVApAqNR/ZYjBN8=;
 b=iSsk2C8DrhX04kYEzqgZnZxyOC4byjo09BN3CM4vf5YOjP4AB7d68b9gp9Jrxu1YJB
 HU8HoCMTbDH/AYnczpxyIpxPkpEyoGet5z2+XUjhvrxukHmAKioxFkPZ3Uegnm/olLje
 iZEi3LvXlFMRrqtqIPX0vCVnz+LE6iXCIKaS4CVsvmTEk3PfXanev5YlRdzxhRSXYk6O
 w2CHgYsDVKeDxX0MzPfm2VQLNmhj6IeR25OufJMkQ2p+k9kzAKhRFQifcQN8WK1vePk1
 3dqmPeuEGg+76DT62zlNa+W0nXz4pS3ZPuP4HrKeKnh86Z0yCPjmnot5Hsi9WiAXIHaB
 5XCQ==
X-Gm-Message-State: APjAAAXVLi9c3bF0foPAEoGR1ceLY6TeZ1o4YwcoSGgzReVUDn+U4N9t
 I+K/yNK5LOTdMadfeEQixVMyI+nmDiQ=
X-Google-Smtp-Source: APXvYqzvh+e0I5Ss8OJ6dXfWj5QYwqEePiy+n7plFZt2gvbA4jiTYbSUkO/XHLsd90BtMA5rh7A2LA==
X-Received: by 2002:a0c:e6a2:: with SMTP id j2mr21782293qvn.190.1560799084629; 
 Mon, 17 Jun 2019 12:18:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 063/459] drm/amdgpu: add fw load type flag for rlc autoload
Date: Mon, 17 Jun 2019 14:10:24 -0500
Message-Id: <20190617191700.17899-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7dDyus8Jtq0taOc4PrmHpSD2ECCsVApAqNR/ZYjBN8=;
 b=JVmbUNHpWDsg0NWvYBvbu0ljgLAQyPqJvLmhVmiqFOu31aAo5dxxP42wvh3fDTx90X
 2VsPEQ9W+dnD6Gp1WOxK8aCDd65X8V9kmL5HoDU0NjYA8Z20BbiSrRfgbr+vgw9a/par
 J8pC7vTqEZjoduxMqZo05qRweCoahjIA0lxyysg8aA9nqgbgjUllxTuJjFNS1YX6scaj
 XSi6GnUYYS7CZtUJvJH2uOW0pLP4oqbHkT8zy/LWUZCV5CyciITfushyEcLq0+y/5bxb
 NW16c9st2GLlPDeyfBiYLKmQZzypoK6hhkWkfCQpHIbdZh96Uq6KE8mrlRyymmCy6pzW
 3KvQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Le.Ma" <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIkxlLk1hIiA8TGUuTWFAYW1kLmNvbT4KCkFkZCBhbm90aGVyIGZpcm13YXJlIGxvYWQg
dHlwZSBBTURHUFVfRldfTE9BRF9STENfQVVUTyB0byBzdXBwb3J0IGZpcm13YXJlCmF1dG9sb2Fk
aW5nIG5ldyBmZWF0dXJlIGluIGdmeDEwLgoKVGhpcyBmbGFnIGNhbiBiZSBsZXZlcmFnZWQgZm9y
IGZ1dHVyZSBlbmdpbmVzIHRoYXQgbmVlZCBhdXRvbG9hZCBmdy4KClNpZ25lZC1vZmYtYnk6IExl
Lk1hIDxMZS5NYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXggMTM0N2QzZTNjZWE2Li43N2VjNjg3ODdjM2Ug
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCkBAIC0yMzgsNiAr
MjM4LDcgQEAgZW51bSBhbWRncHVfZmlybXdhcmVfbG9hZF90eXBlIHsKIAlBTURHUFVfRldfTE9B
RF9ESVJFQ1QgPSAwLAogCUFNREdQVV9GV19MT0FEX1NNVSwKIAlBTURHUFVfRldfTE9BRF9QU1As
CisJQU1ER1BVX0ZXX0xPQURfUkxDX0FVVE8sCiB9OwogCiAvKiBjb25mb3JtIHRvIHNtdV91Y29k
ZV94ZmVyX2N6LmggKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
