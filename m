Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F95D772
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7D06E069;
	Tue,  2 Jul 2019 20:29:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060C6E05F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:26 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x47so20129054qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmY474hNvCYruDXMJg7JSv4hSzKucFWJI9UCB/iCQJ0=;
 b=mQzTPYkaz5Lm2DsjKVFAaER6arDuCPIlTYYMF2ZtsJUwkU89br72cZkRtN4BdNFVfM
 3yy3LxuIO8ZaiQZXez9q4C5rl/xFRuUami0JpDFYbL48L/xLMKHkAM6zdKlKbkhn4FIb
 DnRgtq0S4NYBRP2Y+wrjAz0qGJ4SSVl6R9tq9KUnwMtt7mRPqF2BmnIKx1DU1WyTBKso
 SMRXEsojf/Tjz1H6DJK13tdsDNUPjG6Ka1LlvN0ZJhEa87+p6KpZfgUi+cd5d0tEVplh
 ywBqBfGjFayw6FmnhFo/zxO5lHLcV/++Qt7eEVeRBwv3nU2aiZYZiHf+vfFSL6a5CZv3
 ix3g==
X-Gm-Message-State: APjAAAWJoGfUFsb4jabQY6r0kO5ZPzrwo6VZI5Rt1qxOpUT5MtWjlXLo
 4uWZ8ZS9RrrCp2+FOQOy4JyYFxpnurU=
X-Google-Smtp-Source: APXvYqzFVQwX8MP4Fij6ggAN1KkhzuzmLttS4dBJp/di7AlAIlTpUHVDJf6QdrHpYDp6LTig6mh46g==
X-Received: by 2002:a0c:91d4:: with SMTP id r20mr27959452qvr.12.1562099365533; 
 Tue, 02 Jul 2019 13:29:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 34/53] drm/amdgpu: enable sw smu ip for navi14
Date: Tue,  2 Jul 2019 15:28:25 -0500
Message-Id: <20190702202844.17001-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmY474hNvCYruDXMJg7JSv4hSzKucFWJI9UCB/iCQJ0=;
 b=KxTHipHvFlvDqzX5ps6Bpo2Qvlz/pDHq07z9edfcNpq993ApBzzV9rrk7+YuKR+W/v
 jYsAVQ7a5RWKY6tufMp+SxJXbdk/FrApfnzbqIYV0x0zjigHPZ/WW5gPOz6WNuOAKmBY
 c05X7vcq0VnLSC+f3WjlJfgLOkjnxJAxz3Ap2RaCpCgjgQA8cO2WrH5qRc8TAz5F8lHt
 Sbdu+MXpvXs9PYZithXC2FGg9zqDhsi1KWuwBfd18jpEYYdJd6thb7egzOQAo0xgwOTJ
 gtJnmX5Ar70D6UThhseMo+lk7sWEZfBCzgMBI+5yRon2QHYcWYS6FdVw0KuLufDsu7QU
 rF5g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDU1OTMyZGNlZDMxMS4uMjM4YzViYjA1NjIz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTM2Nyw2ICszNjcsOCBAQCBpbnQgbnZfc2V0
X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJmdtY192MTBfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsICZuYXZpMTBfaWhfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNl
X2lwX2Jsb2NrX2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsKKwkJaWYgKGlzX3N1cHBv
cnRfc3dfc211KGFkZXYpKQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNt
dV92MTFfMF9pcF9ibG9jayk7CiAJCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8
IGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFk
ZXYsICZkY2VfdmlydHVhbF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
