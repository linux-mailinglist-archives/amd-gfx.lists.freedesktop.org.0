Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I8uiDd29J2qi1QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 09:16:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8865D19D
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 09:16:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=oss.cyber.gouv.fr header.s=default header.b=Y+EP+8Xf;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=oss.cyber.gouv.fr (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECA810E130;
	Tue,  9 Jun 2026 07:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9710F229
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2026 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=oss.cyber.gouv.fr; s=default; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=unTOmNXT2cKtw/Da+JBX9e3LHV6MJiDmeHutuLu9qps=; b=Y+EP+8XfwYOIDQNAp79GNRsbSS
 KcvUht77Vjf2bY9EBz2BitjqJJ63X/f+hHH3uaGxENrufnh9Y3xrTsPsavITVu7t6E/geWruMZCG8
 LW7AOxfmtgGByWPl/sYuHGxNw+e9AvAmtq+Nh2xsxImqOs8codkF0/yK1xJQVYRewNG8CkpjZLvW9
 WyuY15pOWZ0T/OuLeXD5FCooqQ7plLal2Kag0brrsXCHsU8YXAOk0335krLwhb0E3ITXLs1mzzkcq
 9otO8PqSjReR9YW9ijP1KterCZov+ydwfqSJ2zzt9190WGU85m7NwHF8yMMQEckoE0Y5R0fIIBe20
 DZ1QkYIQ==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr
 ([90.63.246.187]:56605 helo=archlinux)
 by pf-012.whm.fr-par.scw.cloud with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.99.4)
 (envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
 id 1wWY8j-00000000Osz-23x6; Mon, 08 Jun 2026 13:27:32 +0200
Date: Mon, 8 Jun 2026 13:27:31 +0200
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
To: "Kamal, Asad" <Asad.Kamal@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>, 
 "Ma, Le" <Le.Ma@amd.com>, "Zhang, Morris" <Shiwu.Zhang@amd.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wang,
 Yang(Kevin)" <KevinYang.Wang@amd.com>, 
 "StDenis, Tom" <Tom.StDenis@amd.com>
Subject: Re: [PATCH v3] drm/amdgpu: Gate debugfs MMIO access on kernel lockdown
Message-ID: <aialwv31-f-Rt06W@archlinux>
References: <20260603114459.938031-1-asad.kamal@amd.com>
 <aiaEMl-b5qo6dmL6@archlinux>
 <DM4PR12MB5038BE603641525F68C9C3018E1C2@DM4PR12MB5038.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR12MB5038BE603641525F68C9C3018E1C2@DM4PR12MB5038.namprd12.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id:
 nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Tue, 09 Jun 2026 07:16:41 +0000
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
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[oss.cyber.gouv.fr:s=default];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[oss.cyber.gouv.fr : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Asad.Kamal@amd.com,m:Lijo.Lazar@amd.com,m:Hawking.Zhang@amd.com,m:Le.Ma@amd.com,m:Shiwu.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:KevinYang.Wang@amd.com,m:Tom.StDenis@amd.com,s:lists@lfdr.de];
	HAS_X_AS(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr];
	HAS_X_GMSV(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oss.cyber.gouv.fr:-];
	FORGED_SENDER(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr,amd-gfx-bounces@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr,amd-gfx-bounces@lists.freedesktop.org];
	HAS_X_SOURCE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[amd-gfx];
	HAS_X_ANTIABUSE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[archlinux:mid,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BE8865D19D

On Mon, Jun 08, 2026 at 11:03:05AM +0000, Kamal, Asad wrote:
> AMD General
> 
> Hi @Nicolas Bouchinet
> 
> Thank you for the review.
> 
> The commit message references v1 behavior and is no longer accurate. Writes are already blocked, the existing debugfs_locked_down() in fs/debugfs/file.c handles writes when FMODE_WRITE is set, the early-return guard fails and security_locked_down(LOCKDOWN_DEBUGFS) blocks the open under [integrity].
> 
> The patch addresses only the read path. Here is why reads are not blocked by debugfs_locked_down():
> 
> static int debugfs_locked_down(struct inode *inode,
>                                struct file *filp,
>                                const struct file_operations *real_fops)
> {
>     if ((inode->i_mode & 07777 & ~0444) == 0 &&
>         !(filp->f_mode & FMODE_WRITE) &&
>         (!real_fops || (!real_fops->unlocked_ioctl &&
>                         !real_fops->compat_ioctl &&
>                         !real_fops->mmap)))
>         return 0;
>     if (security_locked_down(LOCKDOWN_DEBUGFS))
>         return -EPERM;
>     return 0;
> }
> 
> For a read-only open of amdgpu_regs (mode 0400, no ioctl, no mmap):
> 
> 1) (0400 & 07777 & ~0444) == 0 → true - any mode with no bits set outside the 0444 mask (e.g. 0400, 0440, 0444) 0400 satisfies that.
> 2) !(filp->f_mode & FMODE_WRITE) → true for a read-only open.
> 3) No unlocked_ioctl, compat_ioctl, or mmap in amdgpu_debugfs_regs_fops → true.
> 
> All three conditions hold, so debugfs_locked_down() returns 0 and the read open proceeds. The read handler then calls RREG32, a direct hardware MMIO read, with no further lockdown check. That is the gap which this patch is addressing.
> 
> Thanks & Regards
> Asad

Thanks Asad for your explaination !

`LOCKDOWN_PCI_ACCESS` is used in the `integrity` mode of Lockdown and
should be used to protect against Kernel integrity tampering.

IIUC your issue, the access is read-only and thus, you should use one of
the existing `confidentiality` lockdown_reasons. You are free to add a
new one if none of the existing one covers your use case.

Best regards,

Nicolas
