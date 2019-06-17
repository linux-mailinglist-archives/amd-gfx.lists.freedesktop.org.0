Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ACE48E94
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814E289838;
	Mon, 17 Jun 2019 19:27:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488368982A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:21 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i125so6947401qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2/mw6klwQuQf97bMTSSFeS+2fRfLFPRWrbArNwNz2kc=;
 b=iKiF9dmhUcaoNCS3Jr/ihlLr1y1MoN7T75k+l7A6xWsjOBG0cYdpm3qEbPNveEwPlW
 sWQF/jxmjs/7scFK2wuIJV1HuuMViBdfu6Tiq9Cq+O/FgAp59wk7HqD8NJ6cQjlOnKUJ
 Z8LBUUtGtHgxizre4VqvGww12LQQ+0Q22Wg308NB8b84x7sQtipmV1UwIxg1erHlM5r1
 YATIkPcdo9QjIE8TbjbcQGxCzC5ZJwQejT2+/ItQJWgpCykT6qAyAQovDCI4W8dEuj28
 yz0U2YDshCF6SDU6dqDJ91ooquANCyPvvPsexr8O0PSfDQoV7HiPHCk5iMaOV5JHLXl4
 7+5Q==
X-Gm-Message-State: APjAAAXka1ddzBNqaCBd/qc+AH0vYnREutPb2d8EGa8ExZf6LKwZ/eKF
 OkeFcYGANqhzbFrd+EO6oxD8wbJFJ/k=
X-Google-Smtp-Source: APXvYqyqh+6s6Mk1QYTQAtLUVutmu1wJKp6IGCycgbVwkQWgMRCESwrI4kt7Up1U+P850RDEcpVjmw==
X-Received: by 2002:a05:620a:16b2:: with SMTP id
 s18mr84215484qkj.323.1560799640289; 
 Mon, 17 Jun 2019 12:27:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 109/459] drm/amdgpu: add pa_sc_tile_steering_override to
 drm_amdgpu_info_device
Date: Mon, 17 Jun 2019 14:25:34 -0500
Message-Id: <20190617192704.18038-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2/mw6klwQuQf97bMTSSFeS+2fRfLFPRWrbArNwNz2kc=;
 b=BWWNKV3GUEFozBQiTr/9gJ6h6iR1gv+UKrXrZkxn3VCuSe0bN4qZ8h9TeeL76PS53U
 RUXr0pZNIxmgHrqSGoM/odRNyv7v3L1Ek9SwcQoFAvg9jZwyVoKKTRmQS2LdmU4UTnOJ
 tH2c+6xWBy19JWwtQt96zTjpJQVitUvkw1gps0YHiiH/F9QUQtoyuRMW+CudncbvggiS
 ZoH5AQ1jL6aapIO0yFT6cxe4hEDnzeKBsq3wirVL07umYbIswBw8oc6vu1iNsx+vO2cn
 BT0Fvs0z/tfw5e/tI1/WDZRFayRGmJLD6THqMSC9C0J2duxJ+XycRmJjqhK4+XOIMbVP
 /VhA==
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
