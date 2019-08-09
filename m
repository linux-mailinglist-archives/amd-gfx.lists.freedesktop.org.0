Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356F87EA2
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580486EE4F;
	Fri,  9 Aug 2019 15:53:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20DC6EE4E
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id v38so3864962qtb.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ws79m4YAuCudFhsXboA5IniKT/g9Qh01SRssRDyFpIk=;
 b=LuvO+o6WO+8CZKPL9y3vK7H/3DMqKXix5B8uQ8YouDA4XTDDUochQGdivGd6YKN4IO
 7jGyXiU3er6ETLMPjo1Mmw2HvOZAIt9xinnfSTdhxJPvImS2+G+ux3v22oqF6BSNNk7F
 sGgPeXj5vgBGbp9T5khVlkYmWZhInAMcEGMsIoqmAaFYA3QWEWbpAMBAuZNnKfjmWinb
 gNOutB3qWmZEmHqZeaBkLbd09hnCi+qbSMYEXbbH1PNyqtsGi/1Aa9deESebaDy1I7DA
 hMfPjBrDc1x1IQV+GRKYpcSxQrT7BtN6ZuEtRkry6ewS2Th4sbYo05sogeVIOb73r+Mk
 hbgw==
X-Gm-Message-State: APjAAAUGjxZMSbz7wwWsV0muIFyTj78UvrF/yNIXOWyB33ZuHrGz8QlL
 4r7kwPaCYKcQC1733RoW2jZhg7Hs
X-Google-Smtp-Source: APXvYqyRtSdxkNGjO7kuBBbWk77uFr9Pz1w+ZLfTARty/zB45wvKd7H/2+Ji7lE+V/Ff8UyR+tLnfA==
X-Received: by 2002:a0c:fe6b:: with SMTP id b11mr17893138qvv.64.1565366009667; 
 Fri, 09 Aug 2019 08:53:29 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/27] drm/amdgpu: enable power gating for renoir
Date: Fri,  9 Aug 2019 10:52:57 -0500
Message-Id: <20190809155302.4733-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ws79m4YAuCudFhsXboA5IniKT/g9Qh01SRssRDyFpIk=;
 b=F2Cud0NZgV6Gl6MtWycxUADUSVS8o93Nz4Y2fDB3Ebc4SbjGMpx6a+PzANeMYQfY9I
 wSeeoUuWqbzwu32J0gc4gIGXcDSUSWwN7PlDJYYG2qOiGFSKKnwfWubARQKPr8T1b4g2
 9lF2CktQbpALeNV3NMsb8X3W8KBi8iSrXFvnxpG3aXSGJHg9oFg2TsTBN1I0ewnqlv4G
 aT+8UoWL2bhFH/beGG1A4U4Fo25itiyL4TbeGsmENA2si0K/Z+qaXIvFEi1hgfaNWNW2
 fGfK2aK/eUhOiG6G1InfRaRubb1ASIbK6pr/r+tcQP49vZ800WsqJI6jnIVDGbc0MLkP
 BraA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmVuYWJsZSBnZnggcG93ZXIgZ2F0
aW5nIGZvciByZW5vaXIKClNpZ25lZC1vZmYtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5j
b20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDI0YjgyOTgyYzMyNC4uMmFh
ZTMzNzNlYWJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTQ3OTUs
NiArNDc5NSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKHZv
aWQgKmhhbmRsZSwKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1JB
VkVOOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCWlmICghZW5hYmxlKSB7CiAJCQlhbWRncHVfZ2Z4
X29mZl9jdHJsKGFkZXYsIGZhbHNlKTsKIAkJCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmYWRl
di0+Z2Z4LmdmeF9vZmZfZGVsYXlfd29yayk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
