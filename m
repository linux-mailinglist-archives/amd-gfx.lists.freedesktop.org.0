Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61848FD5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BED89CF7;
	Mon, 17 Jun 2019 19:46:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C9889CE0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:58 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so12323296qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9u9+IBdEmnidp8SP0SPpT3XtgGKOd2l2T8oXga8vctI=;
 b=Klj8FA+3IkS5cD1Iq6yXeF/TsL3ow29Rgp5YnUowD/MsdZplKSe5T4qmmxEOQZ/c7M
 swaJve4o45afT60o4/fftgZ3cb7Njt7x3VkbHdWiYOamBH24+bqYobLNwEtrwPnvy51d
 /h2VnKCsHaYNe2nbVI9ApXVgFxIhkmLp/jxHFCXfeTQD5/YGI6nReyUdxF3LbrMBlglM
 rrpATBHtZxnaGl04t+zVkMn2489YZsRUeuI2SCFiVakFLucXGZNJ6NHeg5c00qLnUhY2
 zgD3Z4jsQXCEqlEHt4bZHQjA4Q8c4ZMryLHsbCLff05aUuk5/rueda6sKoqpc8M388Xx
 vBZw==
X-Gm-Message-State: APjAAAU182DuMaV+5doyFAvuuGGx8yGxfxkrA09bWiJpmSrNfErgW3GN
 914oGOOa2kEAs8WOSbBX2gVO64H0PQk=
X-Google-Smtp-Source: APXvYqy4WbhoyZS53HFhiehentRgkzqCOPwU4DV66sOPGDsxJQWf0sPH3amlH5ic72klPN9OEsyHmA==
X-Received: by 2002:ac8:28e2:: with SMTP id j31mr55979652qtj.274.1560800758013; 
 Mon, 17 Jun 2019 12:45:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 307/459] drm/amd/powerplay: enable BACO feature as WAR
Date: Mon, 17 Jun 2019 14:44:08 -0500
Message-Id: <20190617194540.18497-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9u9+IBdEmnidp8SP0SPpT3XtgGKOd2l2T8oXga8vctI=;
 b=m+H43T/rX/sbqWtTTET7POf97h1k5sQPQu9S1kT8tetn10o7VtOUxpbLs1N7mxdWwl
 KVQu2HbwFz9VoDIx31ION5qclRBVtTd83G7DO+/Y6/bbM7mfk4To6GF/Xu7RQ63tzJCP
 zxrfBvbeMPWHAGl+Mt0i0Vn7khDqIKelBmIbP5vrQNdy7AwgNrYX5TI3OhuWWoA98BbT
 dKaKSAl7jCx+QzxsLMTHQyRzuIEUL5u70SkMv4V3FfrpS8iJ5bZdwrimWyNlFwdPnDfy
 EEQtsb/mXQ28Fm0XOG/U5NM7/BsogrJ52J9aAt2XL8hYBtN53a9mKS0sw5H41qyoKaD1
 6ySQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IHdvdWxkIGhpdCBTTVUgZncg
YnVnIHdpdGhvdXQgQkFDTyBlbmFibGVtZW50IHdoZW4gYXVkaW8KZHJpdmVyIHB1dCBhdWRpbyBk
ZXZpY2UgdG8gRDMgc3RhdGUuIEJlZm9yZSB0aGUgYnVnIGluIFNNVSBmdwpnZXQgZml4ZWQsIGVu
YWJsZSBCQUNPIGZlYXR1cmUgYXMgV0FSLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNr
LlhpYW9AYW1kLmNvbT4KQWNrZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGM0YmQxNGFiMmFkZC4uZjc4MWM3ZjRiYTQ2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0zMzEsNiAr
MzMxLDcgQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RTX0dGWENMS19CSVQpCiAJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19EQ0VGQ0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFT
SyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9CQUNP
X0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklUKTsKIAogCWlmIChhZGV2
LT5wbS5wcF9mZWF0dXJlICYgUFBfTUNMS19EUE1fTUFTSykKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
