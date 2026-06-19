Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3SoNz+RNWryzwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:58:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B456A7701
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:58:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6E010E0EC;
	Fri, 19 Jun 2026 18:58:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 676 seconds by postgrey-1.36 at gabe;
 Fri, 19 Jun 2026 18:58:04 UTC
Received: from osnlsmtp01-04-t2.prod.phx3.secureserver.net
 (osnlsmtp01-04-t2.prod.phx3.secureserver.net [50.63.9.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885B10E0EC
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 18:58:03 +0000 (UTC)
Received: from sharp.hemidemisemiquaver.net ([72.167.35.172])
 by : HOSTING RELAY : with ESMTPS
 id aeDpwJDyaeluzaeDpwoJx8; Fri, 19 Jun 2026 18:45:45 +0000
X-SECURESERVER-ACCT: 72.167.35.172
x-originating-ip: 72.167.35.172
X-CMAE-Analysis: v=2.4 cv=fo12ol4f c=1 sm=1 tr=0 ts=6a358e59
 a=M/WKzYUEIA11DK1ad7GclQ==:117 a=M/WKzYUEIA11DK1ad7GclQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=gf1sU9SwAAAA:8 a=2Y_eCKJ9fQo-ujRFqJYA:9
 a=CjuIK1q_8ugA:10 a=q14etN5UfmJ00A5_7_od:22
Received: from feralsw.com (feral [172.30.7.254])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sharp.hemidemisemiquaver.net (Postfix) with ESMTPS id 867337E701;
 Fri, 19 Jun 2026 18:45:46 +0000 (UTC)
Received: from optiplex.in1.lcl (optiplex.in1.lcl [172.30.1.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by feralsw.com (Postfix) with ESMTPS id 3E42482033F;
 Fri, 19 Jun 2026 11:45:46 -0700 (PDT)
Received: by optiplex.in1.lcl (Postfix, from userid 1000)
 id 24540520058; Fri, 19 Jun 2026 11:45:46 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
 by optiplex.in1.lcl (Postfix) with ESMTP id 2271D520057;
 Fri, 19 Jun 2026 11:45:46 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:45:46 -0700 (PDT)
From: Matthew Jacob <mjacob@feralsw.com>
To: alexdeucher@gmail.com, christian.koenig@amd.com
cc: amd-gfx@lists.freedesktop.org, feralmatt@pm.me
Subject: [PATCH] Support some Barco AMD based graphics adapters
Message-ID: <1b83ac6f-1018-3dee-c029-1b2ed78a8460@feralsw.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CMAE-Envelope: MS4xfMNvg/OUcRGn9ewfdWpNlhT9goknWD9KKgRTmX382fWMH+cifaqVF0e3MdA+rFbA9g5Vns/Ojtc97NSZ15lFrcyP5hJg3BFrhrtv/IsuVptrtpoIwjpd
 PGf1Rx8PjQneodxTtIb7EW4ZTm40zMLu5bWKBZtB8cDFxINDqy+utwZNM78VGP1VWL+4cwrti9q30gKwd0UrmCr2pvk+aC+cHVw2hkGaBOfhh/MvDwTpguD2
 ePOnvXrKr6nrladhfrBOdejBloFqpWYSNH3bc83tqd34ogCPgDpZnzw1GpT2OM1w8hMsQ2LeQtNB7FYgF5JCDg==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[feralsw.com];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:christian.koenig@amd.com,m:feralmatt@pm.me,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[mjacob@feralsw.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mjacob@feralsw.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[feralsw.com:email,feralsw.com:mid,feralsw.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33B456A7701

These adapters typically are only supported by Barco on the Windows 
platform. However, with these changes in the linux driver, multiple 
monitor support should work correctly.

Signed-off-by: Matthew Jacob <mjacob@feralsw.com>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 60debd543e44..e3ba168795cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1926,6 +1926,7 @@ static const struct pci_device_id pciidlist[] = {
  	{0x1002, 0x6646, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_IS_MOBILITY},
  	{0x1002, 0x6647, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_IS_MOBILITY},
  	{0x1002, 0x6649, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
+	{0x1002, 0x664D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE}, // Barco MXRT-5600
  	{0x1002, 0x6650, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
  	{0x1002, 0x6651, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
  	{0x1002, 0x6658, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
@@ -1995,6 +1996,7 @@ static const struct pci_device_id pciidlist[] = {
  	{0x1002, 0x6930, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
  	{0x1002, 0x6938, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
  	{0x1002, 0x6939, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
+	{0x1002, 0x693B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA}, // Barco MXRT-7600
  	/* fiji */
  	{0x1002, 0x7300, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
  	{0x1002, 0x730F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
@@ -2023,6 +2025,7 @@ static const struct pci_device_id pciidlist[] = {
  	{0x1002, 0x67C4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
  	{0x1002, 0x67C7, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
  	{0x1002, 0x67D0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
+	{0x1002, 0x67D4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10}, // Tentative Barco MXRT-8750
  	{0x1002, 0x67DF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
  	{0x1002, 0x67C8, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
  	{0x1002, 0x67C9, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
@@ -2036,6 +2039,7 @@ static const struct pci_device_id pciidlist[] = {
  	{0x1002, 0x6985, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
  	{0x1002, 0x6986, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
  	{0x1002, 0x6987, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
+	{0x1002, 0x698F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12}, // Tentative Barco MXRT-4700
  	{0x1002, 0x6995, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
  	{0x1002, 0x6997, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
  	{0x1002, 0x699F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
-- 
2.47.3

