Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7149052
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4A16E045;
	Mon, 17 Jun 2019 19:50:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0886E040
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i125so6994740qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNATHPTYksq1SMYBU+WuU5yNOaZrrrwcfJzezIR3g5U=;
 b=GXVSdq97pxO6PzTnERGRofATgsxqLj78pMWiX5LAW+MnhwQbV9jOLfQFc19GzoYYAp
 giHIK9K90w35xqEQVsfMDfpsj0zNyWCoSc2Vo8cUtfSpnnx4T8v8KcktOl1FOr3hnAb/
 jfWr+h7PWG9KoSVUlIomZtv9FedmzUMnOcbgrqrzUfmj3VzCP2lqunKECiPkbOMPYLCg
 MtMaBb8eU/F53m+pMl2Om/oE0O6URWebL7IjXx2JoOGN2ph/c7RVQF63txig//uT4/rs
 +wQnBQdNrCs0Tzva+7B5bIbSpNAXjlRPqsmwkGmLTwLnNMV39mkql9dG7zgnrdFqXRbf
 ye6A==
X-Gm-Message-State: APjAAAVS09Les7oei/95cXNCYSgu34w08JMIy/ul9/lrTvs9SjTU65AH
 crQhlq0c60+mbhMYl72Dz2xnCH8Kcu0pBA==
X-Google-Smtp-Source: APXvYqzenGTUjMM+n2ha1AdyzHQhVZkYHtekHtRAXjLQfBDA7xrvd721LWDpewMaTJXS/s98okOWmA==
X-Received: by 2002:a37:9207:: with SMTP id u7mr92731408qkd.357.1560801001908; 
 Mon, 17 Jun 2019 12:50:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 406/459] drm/amd/display: add SW_USE_I2C_REG request.
Date: Mon, 17 Jun 2019 14:48:55 -0500
Message-Id: <20190617194948.18667-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNATHPTYksq1SMYBU+WuU5yNOaZrrrwcfJzezIR3g5U=;
 b=N5pWmkpyef18cGG5XiuPeq539Zjqk2kFizhGTtaFOgxyTHJCzwc4USs3c01AR/xtY3
 MuFBC7iIOkxZJSvxgGZ+B5pjs2vehrxUNCNsZV4pI9yFCAbz0yVzdhgg3v7PVPI6Ah6j
 EVsEWqzKToDjN5qXmafIB4SLzl5QGVcnuYSKjl2D5eswC+fXUq2PKbLMLCyIz5120Gbe
 vi6JAco2mSSncSQmYg9BKqeSp9rt8TZiGoSwz9DEgbwJXqH4yt9qaLzGSFS/A2/iVYjA
 d5Ke8JMAPN2fQCFbxH8y9c7FTMnZTYJh/livu9xXrw6/P6dGSGPE2buFzMAKwzVSkNCB
 QduQ==
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
 Charlene Liu <charlene.liu@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Bhawanpreet Lakha <BhawanpreetLakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
VGhpcyBpcyBmb3IgRENfSTJjIGFyYml0cmF0aW9uIHVzZSBiZXR3ZWVuIEhXIHVzZS9TVyB1c2Ug
YW5kIERNQ1UgdXNlLgoKU2lnbmVkLW9mZi1ieTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtydW5vc2xhdiBLb3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMKaW5kZXggZDY1OGI4NjI0MzBhLi5iMjc4NmE3MDQ3
MDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2ky
Y19ody5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19o
dy5jCkBAIC0zMDYsNiArMzA2LDggQEAgc3RhdGljIGJvb2wgc2V0dXBfZW5naW5lKAogI2lmIGRl
ZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8wKQogCXVpbnQzMl90ICByZXNldF9sZW5ndGgg
PSAwOwogI2VuZGlmCisJLyogd2UgaGF2ZSBjaGVja2VkIEkyYyBub3QgdXNlZCBieSBETUNVLCBz
ZXQgU1cgdXNlIEkyQyBSRVEgdG8gMSB0byBpbmRpY2F0ZSBTVyB1c2luZyBpdCovCisJUkVHX1VQ
REFURShEQ19JMkNfQVJCSVRSQVRJT04sIERDX0kyQ19TV19VU0VfSTJDX1JFR19SRVEsIDEpOwog
CiAJLyogd2UgaGF2ZSBjaGVja2VkIEkyYyBub3QgdXNlZCBieSBETUNVLCBzZXQgU1cgdXNlIEky
QyBSRVEgdG8gMSB0byBpbmRpY2F0ZSBTVyB1c2luZyBpdCovCiAJUkVHX1VQREFURShEQ19JMkNf
QVJCSVRSQVRJT04sIERDX0kyQ19TV19VU0VfSTJDX1JFR19SRVEsIDEpOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
