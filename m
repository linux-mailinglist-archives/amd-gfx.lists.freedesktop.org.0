Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKgDIinRs2ncbAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:56:09 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15475280104
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83C10EB62;
	Fri, 13 Mar 2026 08:56:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B9310EA98;
 Thu, 12 Mar 2026 19:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4DE582C14A8;
 Thu, 12 Mar 2026 20:33:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yCwNT8mwVvHB; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8A34D2C14AA;
 Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3HN7guaAFMsE; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id ABF4A2C14A6;
 Thu, 12 Mar 2026 20:33:42 +0100 (CET)
Date: Thu, 12 Mar 2026 20:33:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx <amd-gfx@lists.freedesktop.org>, 
 apparmor <apparmor@lists.ubuntu.com>, bpf <bpf@vger.kernel.org>, 
 ceph-devel <ceph-devel@vger.kernel.org>, cocci <cocci@inria.fr>, 
 dm-devel@lists.linux.dev, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 gfs2 <gfs2@lists.linux.dev>, intel-gfx <intel-gfx@lists.freedesktop.org>, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-block <linux-block@vger.kernel.org>, 
 linux-bluetooth@vger.kernel.org, 
 linux-btrfs <linux-btrfs@vger.kernel.org>, 
 linux-cifs <linux-cifs@vger.kernel.org>, linux-clk@vger.kernel.org, 
 linux-erofs <linux-erofs@lists.ozlabs.org>, 
 linux-ext4 <linux-ext4@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 linux-gpio@vger.kernel.org, linux-hyperv <linux-hyperv@vger.kernel.org>, 
 linux-input@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-leds@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, 
 linux-mips <linux-mips@vger.kernel.org>, 
 linux-mm <linux-mm@kvack.org>, linux-modules@vger.kernel.org, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-nfs <linux-nfs@vger.kernel.org>, 
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-phy@lists.infradead.org, linux-pm <linux-pm@vger.kernel.org>, 
 linux-rockchip <linux-rockchip@lists.infradead.org>, 
 linux-s390 <linux-s390@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>, linux-sctp@vger.kernel.org, 
 LSM <linux-security-module@vger.kernel.org>, 
 linux-sh <linux-sh@vger.kernel.org>, 
 linux-sound <linux-sound@vger.kernel.org>, 
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
 linux-usb@vger.kernel.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, ntfs3 <ntfs3@lists.linux.dev>, 
 samba-technical <samba-technical@lists.samba.org>, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs <v9fs@lists.linux.dev>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1584421372.26258.1773344022512.JavaMail.zimbra@nod.at>
In-Reply-To: <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
Subject: Re: [PATCH 48/61] mtd: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148
 (Linux)/8.8.12_GA_3809)
Thread-Topic: Prefer IS_ERR_OR_NULL over manual NULL check
Thread-Index: 0l8CyewQmrWlgaG6N3QgQFfukutRbA==
X-Mailman-Approved-At: Fri, 13 Mar 2026 08:55:39 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[nod.at];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,avm.de:email,nod.at:mid]
X-Rspamd-Queue-Id: 15475280104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

----- Urspr=C3=BCngliche Mail -----
> Von: "Philipp Hahn" <phahn-oss@avm.de>
> -=09if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
> +=09if (!IS_ERR_OR_NULL(gpiomtd->nwp))

No, please don't.

This makes reading the code not easier.

Thanks,
//richard
