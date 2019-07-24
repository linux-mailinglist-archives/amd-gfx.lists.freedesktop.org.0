Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8073202
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3396E5BA;
	Wed, 24 Jul 2019 14:43:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E376E5B9
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:43:43 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id r6so41502515qtt.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKBlkAFbdx9oOtXlsieQe3/Q6p+zym0RqP4Ic97d4kY=;
 b=XiX2NmUR2o/E6w8EOXK7/sznXa/5SOLgh0Go5UpM5hyqJ+MaekhlKrhZP374v8b02E
 1zt1VVljj917eFtHUnQQArm3VdhK5cEQu1U2gE+Tw9MAoZVvKLIX2iN7W7/tGPnLO4aq
 uyzswfNLoeluaO/wfdwiKsejEkSkZGU29oGllWXPLzZFO6cSxNQ3DD8pqe3GvAq3qHTI
 FgLQWScnjzHZYgZXA7HtIMhvnE+CorjEI8w4McAOhGOqISQqZwx7eays1jBNdbCrEiC0
 sT3Okr/bw0+VXyHSI94glJfWSHM+7IEuGqzODW170XEB2WtFebJ4Fmez7426LKuGMHQJ
 /DEQ==
X-Gm-Message-State: APjAAAVVPh0DCOcViQBHGIJcTIY3ct+2zQpPcsaB5VUOoPN+OOZ4Z6uS
 cdXL5GcUWxQsY0hfjceMsVkjpEiC
X-Google-Smtp-Source: APXvYqyvRp2RgzZHoxWFjkvXJpC7aWfVs0AjHngzVmmew5U/UTtdFF2b0RmJXR8tHcXQJgVTVPsGRQ==
X-Received: by 2002:a0c:8aaa:: with SMTP id 39mr59870440qvv.17.1563979422066; 
 Wed, 24 Jul 2019 07:43:42 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a6sm21120223qth.76.2019.07.24.07.43.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:43:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] Revert "drm/amdgpu/powerplay/vega10: call
 PrepareMp1ForUnload in power_off_asic"
Date: Wed, 24 Jul 2019 09:43:32 -0500
Message-Id: <20190724144333.24047-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724144333.24047-1-alexander.deucher@amd.com>
References: <20190724144333.24047-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKBlkAFbdx9oOtXlsieQe3/Q6p+zym0RqP4Ic97d4kY=;
 b=VoG89nMKh3pP9bpQqxLb4nl/hxkCmK0lCtldE1xMWFZlhbw37bV/nzkzzW6+xencTM
 Jv5b+uQFp0TdH97lW47erBfAn1hHTJgknO6V0kYlhz8E7yHUZPW0r6fRA5vwqbIrzxCw
 M3Z7UMJxTtbWc3NwaeulB6POqJi/G7B4shrBDAznWaaMKvwfIAG4qBbc1MF/F0Hm9p08
 tGhtDhMeXvAOmVrye58pHXKum3cvmbZzOLvstgVYV8Q1N4Tf5fFxLqxuOz9KJ+JcKZP7
 O0xurxH8uLClz8UzualCCqJi8T0QwOSXoeYEm0shpx8C2HO+Em/gCtcMOkyKj6VV2Ff9
 quPQ==
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

VGhpcyByZXZlcnRzIGNvbW1pdCA4NWNkZTNmODgwMDkyYmQ1YTIxNzYwZWJlN2JhYWE0ZDZhZjM4
OWE5LgoKUmV2ZXJ0IGZvciBub3cgcGVuZGluZyBmdXJ0aGVyIGRpc2N1c3Npb25zIHdpdGggcG93
ZXIgdGVhbS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBf
aHdtZ3IuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5k
ZXggYTYwNjZkOTJkZTc4Li4xZDliYjI5YWRhZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCkBAIC00NzQwLDExICs0NzQwLDYg
QEAgc3RhdGljIGludCB2ZWdhMTBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21n
cikKIAkJCSk7CiAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICY9IH4oV2F0ZXJNYXJrc0xvYWRl
ZCk7CiAKLQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPSBzbXVtX3NlbmRfbXNnX3RvX3Nt
Yyhod21nciwKLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwKLQkJCSJb
UHJlcGFyZU1wMUZvclVubG9hZF0gRmFpbGVkISIsCi0JCQlyZXR1cm4gcmVzdWx0KTsKLQogCXJl
dHVybiByZXN1bHQ7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
