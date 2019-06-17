Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594B48DFA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DE5894A7;
	Mon, 17 Jun 2019 19:18:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE9892AA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:01 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so7219348qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZ1+xFtcF4/HVQypVwJkTuR39lP7B6Tps6UCWu3tMlc=;
 b=LYdoqCwZf0TWsqkj5Dk7RJjItnA1YNFwJdtbk+lvlSIfd8xE0uK4dmm2uLiEMf6bTM
 oOxPZkKH1SAwLe35SfqgnuRCQRKxaaI/VoP7lEAsMf6HaMtKEUHEH1/G43A/TsZez1gA
 T4wsBJRh4ykYcS4rAhC83tSyL68PdESEs90dvLNq0A01CHeMI5lG0N3yEyurcYbIY7WA
 2h+DMM7FQARszO//ZZKrTBXXYKgtDak/mNbOud0EvrHrUuJe7DWZxvA14vCVMpKCkmie
 UFHGZbJ47rZMvzyl5m66YFSsIeoK+SYT4OXkGcVoQprB0XsameqTSbbNLN5ryV9aNT2k
 HZ3g==
X-Gm-Message-State: APjAAAUUd59qIyCTlIvEDWpdmR27JTVAvrKnpOsQqaswCk8lysllOCMC
 recWkL0RJl46PEmGVEV9vUOG+W4hmO8=
X-Google-Smtp-Source: APXvYqxJnQ7MBbN+H+aEZ1I3aW/RFnBaP8tS6zjb1DF6Yz80qf9IvvmfAeoWzXZfXoUrH6GbHvtp+w==
X-Received: by 2002:a0c:d109:: with SMTP id a9mr12900572qvh.89.1560799080745; 
 Mon, 17 Jun 2019 12:18:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 059/459] drm/amdgpu: add irq sources for vcn v2_0 (v2)
Date: Mon, 17 Jun 2019 14:10:20 -0500
Message-Id: <20190617191700.17899-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZ1+xFtcF4/HVQypVwJkTuR39lP7B6Tps6UCWu3tMlc=;
 b=Xu9OCWTCAq8P2SA0KZd6uokUHzId3bNwiX3eLaz7wH0V40gl/PvLUTD99Licj0UyAA
 0UN26vNbEvClUttNd32lgvJR2EMjWFUhZvC8HXRShmsFLE+A4RUZoi56C9kJPPymynut
 oj9lm+RrfK7Op5IfeDJCDCs2XZe7MvH5rHVAcGcKjxhQv2YMqtpajrd32jw82SS9vSwr
 Ly9tU53JbIIYueeGhqx6cdhdLnw1OhFQ5SvLlDNPHT79qZjoib6My6lQeYCouhdN7KhT
 qHEUF0EIgGt4K+1ZZjKgEXzrKCWbySpzPEJI5hfAJ1nwKxWEeQ+LnhS+zHmk/O8Oryg+
 Gr3A==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdjI6IHVwZGF0ZSAo
QWxleCkKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vYW1k
L2luY2x1ZGUvaXZzcmNpZC92Y24vaXJxc3Jjc192Y25fMl8wLmggfCAzMiArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lkL3Zjbi9pcnFzcmNzX3Zjbl8y
XzAuaAoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lkL3Zj
bi9pcnFzcmNzX3Zjbl8yXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lk
L3Zjbi9pcnFzcmNzX3Zjbl8yXzAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLjE3YWNhYzE0NzAxMwotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9pdnNyY2lkL3Zjbi9pcnFzcmNzX3Zjbl8yXzAuaApAQCAtMCwwICsxLDMyIEBA
CisvKgorICogQ29weXJpZ2h0IDIwMTggQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoK
KyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0
ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0
aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRh
dGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gs
IGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlz
IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBu
b3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwg
cG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURF
RCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJ
TVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1F
UkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBO
T05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xE
RVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisg
KiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JU
IE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04g
V0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhF
IFNPRlRXQVJFLgorICovCisKKyNpZm5kZWYgX19JUlFTUkNTX1ZDTl8yXzBfSF9fCisjZGVmaW5l
IF9fSVJRU1JDU19WQ05fMl8wX0hfXworCisjZGVmaW5lIFZDTl8yXzBfX1NSQ0lEX19VVkRfRU5D
X0dFTkVSQUxfUFVSUE9TRQkJCQkxMTkJCS8vIDB4NzcgRW5jb2RlciBHZW5lcmFsIFB1cnBvc2UK
KyNkZWZpbmUgVkNOXzJfMF9fU1JDSURfX1VWRF9FTkNfTE9XX0xBVEVOQ1kJCQkJMTIwCQkvLyAw
eDc4IEVuY29kZXIgTG93IExhdGVuY3kKKyNkZWZpbmUgVkNOXzJfMF9fU1JDSURfX1VWRF9TWVNU
RU1fTUVTU0FHRV9JTlRFUlJVUFQJCQkxMjQJCS8vIDB4N2MgVVZEIHN5c3RlbSBtZXNzYWdlIGlu
dGVycnVwdAorI2RlZmluZSBWQ05fMl8wX19TUkNJRF9fSlBFR19FTkNPREUJCQkJCTE1MQkJLy8g
MHg5NyBKUkJDIEVuY29kZSBpbnRlcnJ1cHQKKyNkZWZpbmUgVkNOXzJfMF9fU1JDSURfX0pQRUdf
REVDT0RFCQkJCQkxNTMJCS8vIDB4OTkgSlJCQyBEZWNvZGUgaW50ZXJydXB0CisKKyNlbmRpZgot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
