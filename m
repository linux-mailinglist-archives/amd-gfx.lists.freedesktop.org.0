Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eES7D3QRsGnRfAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 13:41:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1724E68F
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 13:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2710E72E;
	Tue, 10 Mar 2026 12:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=avm.de header.i=@avm.de header.b="rRX3stPQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3821210E279;
 Tue, 10 Mar 2026 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143726; bh=g4FFdRUzUDur+rKeacaiCQZ+hQh7tI9Z6NjRyFnQc8w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rRX3stPQMInmxRJPEzximgG0zMf53EmXskDxqUtsKeYEkVQ/dYQttdiJ1RwUnbcpz
 vUIyMp9GJewHbVUEmLcfea/7Tczz6UnxZqIBZpZCQjil3jUyfWJvjrL+lRSOeW+TzV
 m1ne+0b2SGo4W3cNeV9kwvYwa/se7AsaBn9ffb+U=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ad-b734-7f0000032729-7f000001c092-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de
 [IPv6:2001:bf0:244:244::71]) by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:05 +0100
Subject: [PATCH 39/61] irqchip: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-b4-is_err_or_null-v1-39-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=g4FFdRUzUDur+rKeacaiCQZ+hQh7tI9Z6NjRyFnQc8w=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZajgCYubaE210ybXd9Qufza8n+eFtBCfTFO
 oQVV6kxanqJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGWgAKCRA0LQZT0ays
 28ISB/9piM+RbVSziEng1t7dun6orhPWKQV9naYfNjFW3SarwsnzmnBDz0nuaGgkwHFCge92/YT
 C6PE2tX58vKdugSVIB0D9NRq5gq4thjVq3D0H2GAQlza/oKxurc4wdXC5dXInbYl5OUB2w09WQy
 fMKAkwG0m3WFPKRgizEtCKM6l/9q3B4q2rnnpcRKQx0iNvhf+dUkY5BUPSwCcfQvJK7+4PoC/ZE
 ddAoJcpror4/MCI0j47/BVNaHIB5K9WykFVMhov3BZvNavqXT9C64hKXxD2btf1UcwShvWKloSd
 PxNXkra2HopfIdMjPOY9w4hG57NjkAcqg0vkRHvvtwjYvgsZ
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-DB5DFA3D-FD67F9DA/0/0
X-purgate-type: clean
X-purgate-size: 1799
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Tue, 10 Mar 2026 12:41:16 +0000
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
X-Rspamd-Queue-Id: A0B1724E68F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vg
 er.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:maz@kernel.org,m:tglx@kernel.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[multiple-recipients];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com];
	DKIM_TRACE(0.00)[avm.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:dkim,avm.de:email,avm.de:mid,lunn.ch:email,bootlin.com:email,infradead.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Gregory Clement <gregory.clement@bootlin.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/irqchip/irq-gic-v3.c     | 2 +-
 drivers/irqchip/irq-mvebu-odmi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab22faf722dd2b24faf96af636a4bbd..6dc9827357a21ae05dd838fb717871c73f3c7562 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2252,7 +2252,7 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 
 out_unmap_rdist:
 	for (i = 0; i < nr_redist_regions; i++)
-		if (rdist_regs[i].redist_base && !IS_ERR(rdist_regs[i].redist_base))
+		if (!IS_ERR_OR_NULL(rdist_regs[i].redist_base))
 			iounmap(rdist_regs[i].redist_base);
 	kfree(rdist_regs);
 out_unmap_dist:
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index b99ab9dcc14b3ba982876cf5525499d02bc1c997..94e7eda46e81833cfe0479b6fabba715bf4ef6b8 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -217,7 +217,7 @@ static int __init mvebu_odmi_init(struct device_node *node,
 	for (i = 0; i < odmis_count; i++) {
 		struct odmi_data *odmi = &odmis[i];
 
-		if (odmi->base && !IS_ERR(odmi->base))
+		if (!IS_ERR_OR_NULL(odmi->base))
 			iounmap(odmis[i].base);
 	}
 	bitmap_free(odmis_bm);

-- 
2.43.0

