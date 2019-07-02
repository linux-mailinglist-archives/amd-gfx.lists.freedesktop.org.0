Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A009A5D786
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210A56E087;
	Tue,  2 Jul 2019 20:29:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706F36E084
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:42 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so2347qtn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qx0zxRxhvqhIrph8zNfNW0nEKqGyOchyytafUeQkyxw=;
 b=Fnmq/QTpTFIWlcGkKOOjgylNiv6NoFk98x8tY4xCIr5kCOa8H/1Ke6v2A9iRATvwN2
 VX4n75VIopq9ufC2yPzvwqL2eCaqKv1muVFZjYuaSfBrJ9TzwDr4TSYf+Jt/+s28vR6k
 agocy+rtyl+5e/odtVRlDsVrI5TX3f7wUkmlAO2ypzYh1AAtvlIWxgHh1pw+O9wLSrcO
 f7AVUra8dR6X4nXCdwl6EyxBAqB7GsbzRfOcvd3MhA/voMz1laEX5dtAe4TtG0tg878W
 qepVN7BWoWMRvTT/CSPI6hOollTV7auqRyalbj1gZztp+x/fta9uuvcDXJCxpHcnWBQp
 ypeQ==
X-Gm-Message-State: APjAAAUpl9NKiPADn0W5K8PVRrk9cuhxELyTG2dCl0jKvYEFIaz7xTMf
 A5AidLinzddSY4mq/8QOx5/+nUdlvQg=
X-Google-Smtp-Source: APXvYqztyYTMW2C3raT/D8Ktl+bETsaTRpaIpAmLo2yfuqieSQR8QDUDi4J85zfSOfBO9MZwIVhMEA==
X-Received: by 2002:ac8:2f43:: with SMTP id k3mr27586113qta.179.1562099381391; 
 Tue, 02 Jul 2019 13:29:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 52/53] drm/amdgpu: disable concurrent flushes on Navi14
Date: Tue,  2 Jul 2019 15:28:43 -0500
Message-Id: <20190702202844.17001-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qx0zxRxhvqhIrph8zNfNW0nEKqGyOchyytafUeQkyxw=;
 b=jaek96R/cfa+GlMR9V6MHPU8pD+7hvbkfVwz1dWB/BIZEI9advIyvRQXdkICiQSenC
 kkUtIAZYQFfG/Vziyxf5ucS0mzGhr/J8xwb5D4pJcs1Er5mCSSaejOc8KePjN9FJR0P/
 rv80YSKzzzGIAc1AIySH6kDqMPhzJKyDKosm132i3wrEUFUkeAou5lSUdrgp3ZPpC+2a
 HS+u0ZDapcHys20eNsfMetVUx+VTwAHrxWrRa5dSIYdUnQz1CGVccS0duduijLhbhYoD
 DOQ2wr2AeCS3xF3qDH7EJDoM27AAAHN3sc0WMXVSl1EmbvQ230EgBJbTooXrPzkUyh76
 CIBA==
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

U2FtZSB0aGluZyBhcHBsaWVzIHRvIG5hdmkxNCBhcyBuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfaWRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaWRzLmMKaW5kZXggNTg5OWQyMTQxODdiLi5jZDE1NTQwYzU2MjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmMKQEAgLTM2OCw3ICszNjgsOCBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bWlkX2dyYWJfdXNlZChzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAkJICogYXJlIGJy
b2tlbiBvbiBOYXZpMTAgYW5kIE5hdmkxNC4KIAkJICovCiAJCWlmIChuZWVkc19mbHVzaCAmJiAo
YWRldi0+YXNpY190eXBlIDwgQ0hJUF9WRUdBMTAgfHwKLQkJCQkgICAgYWRldi0+YXNpY190eXBl
ID09IENISVBfTkFWSTEwKSkKKwkJCQkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEw
IHx8CisJCQkJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxNCkpCiAJCQljb250aW51
ZTsKIAogCQkvKiBHb29kLCB3ZSBjYW4gdXNlIHRoaXMgVk1JRC4gUmVtZW1iZXIgdGhpcyBzdWJt
aXNzaW9uIGFzCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
