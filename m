Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D684E2E
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEBA6E6FE;
	Wed,  7 Aug 2019 14:06:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0A89F6D
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 12:50:24 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hvLOY-0007ey-Lg
 for amd-gfx@lists.freedesktop.org; Wed, 07 Aug 2019 12:50:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id a5so51803287pla.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=uW0MrXbB3BW7ZtLsIKXuNS6TLMaCGNiLsqZ7mbvjEew=;
 b=bYa79uVPaf/FHXW85oIzqodTS8HLXAmti1KtFq/cHmWOl7Wt/JuGmzw4uOKsCaLkbN
 aef2/FRIRDCeWP8BtjzT3fV5LMkcWeSOhT3/Ecsvg7gaM4/VGI8CdzBhMgkkuuYQ/Xq+
 +YK+SAnkTikRJ0MekunOJexDcm8xQ/kgD18/NF+KLIP3M46LrryY0pQ1D82i2GNEwu42
 FgkW9kVwX0MWI6BnViYA23q7ATBfT6W0jIKytNvgLmJlEg76XNnbXCtNkzzdrqdtJWPF
 dqAgEYOLL2PbSLWKclKSxybWl16AKbHvztKm0BhPKEp2QVMLSL5tGYLTiWI6jvfuHgiJ
 K77g==
X-Gm-Message-State: APjAAAW0ePf1mxhZXK+41mjtIsGcpnEVYW4tIpATs27wvfhGVeCh4dOV
 hvuRj77XmJQ26KoKuyYbuj/4738rOlIP7rr7L+24e+pFunis/y68VNyhPfX6QNbDb/qLas3nVlv
 gw1DeZcy7NL0f7YmmYUIgFs14+QVQJ27KtJzgOo9oQW8=
X-Received: by 2002:a17:902:2ea2:: with SMTP id
 r31mr8140594plb.200.1565182221407; 
 Wed, 07 Aug 2019 05:50:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP0mQsPRLO2O4uMJVwX5RbRxIPKKkBUk5N/K6JMpdRXjIw0uJRlI9ss9Nu1lLF3yZ0bhwyuw==
X-Received: by 2002:a17:902:2ea2:: with SMTP id
 r31mr8140558plb.200.1565182221045; 
 Wed, 07 Aug 2019 05:50:21 -0700 (PDT)
Received: from 2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:744a:8654:5394:196d])
 by smtp.gmail.com with ESMTPSA id o129sm68613198pfg.1.2019.08.07.05.50.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 05:50:20 -0700 (PDT)
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [Regression] "drm/amdgpu: enable gfxoff again on raven series (v2)"
Message-Id: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
Date: Wed, 7 Aug 2019 20:50:17 +0800
To: Huang Rui <ray.huang@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 07 Aug 2019 14:06:39 +0000
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
Cc: Chunming Zhou <David1.Zhou@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpBZnRlciBjb21taXQgMDA1NDQwMDY2ZjkyICgiZHJtL2FtZGdwdTogZW5hYmxlIGdmeG9m
ZiBhZ2FpbiBvbiByYXZlbiBzZXJpZXMgIAoodjIp4oCdKSwgYnJvd3NlcnMgb24gUmF2ZW4gUmlk
Z2Ugc3lzdGVtcyBjYXVzZSBzZXJpb3VzIGNvcnJ1cHRpb24gbGlrZSB0aGlzOgpodHRwczovL2xh
dW5jaHBhZGxpYnJhcmlhbi5uZXQvNDM2MzE5NzcyL1NjcmVlbnNob3QlMjBmcm9tJTIwMjAxOS0w
OC0wNyUyMDA0LTIwLTM0LnBuZwoKRmlybXdhcmVzIGZvciBSYXZlbiBSaWRnZSBpcyB1cC10by1k
YXRlLgoKS2FpLUhlbmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
