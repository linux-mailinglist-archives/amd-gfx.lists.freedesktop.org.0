Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278965D765
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1B898AF;
	Tue,  2 Jul 2019 20:29:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA726E062
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so10207qta.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCA29zeX/rw0uJMbwO4BORnRH1lFmtVUkdYU5I8k48w=;
 b=FToWe0nmgsjD7//3itH5Rc0ONnU4PnIb4J5J0jIgH+SwC0HozmfJdzSAqctsna2RIN
 8htVKpDBdgu7jr5jVuRnFHi1rdoGy1EW2ZsZMw1xQA7KA6m/NX754nROrJwKs0WbXfFS
 AlynFBkwf3GEgY9e9KHnRSbdEY4+JMNxvH+vzVXQHU9yAjkySOk3y9ylxaCSxDhEWjAh
 BE4TuMo92W//04hd//jJ/aMqnIfoZuIpzeta9MujMvxf6DbhYLAnUXew/+0HbNzV1a0Q
 qggpRbnul79eauopP906SG2+asrG28cdU4qatvtxZ3iY9Rp14t8QY79UbcxQvtrUeNpr
 R55w==
X-Gm-Message-State: APjAAAWOhkhrEgvfHTS8FsCKRsX0ldp9vmOy4dWEUzlqO+qhYefJE+SD
 Pbf5flXOv9YZnjk2Y1yn7WKryTzCDao=
X-Google-Smtp-Source: APXvYqzxGCtTMl89ZgcxqGdmFmOw4jX0iToHeYghomD13cw5js94rikpoywzyyhTbZz7JZPqQ6QW0A==
X-Received: by 2002:a0c:b4ae:: with SMTP id c46mr28535849qve.230.1562099354336; 
 Tue, 02 Jul 2019 13:29:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/53] drm/amdgpu/gfx: add definition of mmCGTT_GS_NGG_CLK_CTRL
Date: Tue,  2 Jul 2019 15:28:12 -0500
Message-Id: <20190702202844.17001-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCA29zeX/rw0uJMbwO4BORnRH1lFmtVUkdYU5I8k48w=;
 b=Sc7fnHEDnfHvoGiUjAWa4KkmVPDz0te2LiwDpfi5FADW3ed3+AgfP+vmVJufi66F23
 sAf0fOAu+R035RQf+1fM7QWVZNDMgAnngjcDRh3Kv0k6QlNjV8dtBYERf09SPcbLS2Ap
 Lr/ug0YLzRNL0cNR6jzKV1JF16rZS7Pf9/HfJenJ41Qy4aBOqZ73cqpu5ha59PKoo94O
 UnJEX+3UnUkzhs8WobLizNYAVepaQ5kFaeagJsCkDvihrkWDY/Oz9tKofPT9ZAwJk9+C
 skIwb7zqOCbWcg9R8oTXhbMiX1Vt4nvFuCpo+QEcZdq/KuQ1RrioHePsCv6Ut9cyeFw9
 hdgQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCk5lZWRlZCBmb3IgY2xv
Y2tnYXRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmlu
ZGV4IGNiNzMyYWE4ZGU2Ny4uYWEwNDNkM2JmZDE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYwpAQCAtNTYsNiArNTYsOSBAQAogI2RlZmluZSBGMzJfQ0VfUFJPR1JBTV9S
QU1fU0laRQkJNjU1MzYKICNkZWZpbmUgUkxDR19VQ09ERV9MT0FESU5HX1NUQVJUX0FERFJFU1MJ
MHgwMDAwMjAwMEwKIAorI2RlZmluZSBtbUNHVFRfR1NfTkdHX0NMS19DVFJMCTB4NTA4NworI2Rl
ZmluZSBtbUNHVFRfR1NfTkdHX0NMS19DVFJMX0JBU0VfSURYCTEKKwogTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvbmF2aTEwX2NlLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEw
X3BmcC5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9tZS5iaW4iKTsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
