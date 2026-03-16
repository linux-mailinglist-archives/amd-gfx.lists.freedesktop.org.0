Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPUmDVMOuWkaoQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:27 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB72A56F9
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875A610E593;
	Tue, 17 Mar 2026 08:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="eyO5nsRG";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="guCypQjf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Mon, 16 Mar 2026 22:16:12 UTC
Received: from flow-a3-smtp.messagingengine.com
 (flow-a3-smtp.messagingengine.com [103.168.172.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93510E3F8;
 Mon, 16 Mar 2026 22:16:12 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 96E81138028E;
 Mon, 16 Mar 2026 18:10:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 16 Mar 2026 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1773699056;
 x=1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=
 eyO5nsRGgscBaSPTlSrjx8D8qsmxFZTD+YBT90C8JLtkSU+JG9otBsGP68/aDjfq
 Ip8/CY7pDqj8uLfl6tk9PaoCLmHFx9BmC+OLDsgQIKz5wruWwvglBIFTzX8Bgo1G
 D7tyDhfcq/yYvbxAZYbPlVlov+W1BUQwVVZx34myYfSzzczy+o0TvO2AJR+dEy1d
 h9Fy4zA0IHy3AyAu2lJw7cTPeRVsoH7Q9DZJUhPGVmEq8IZ5byXvr46eUf3RwYLV
 Pd21rN+O2sxo21UD0KoApMpHYwnhY5vI1CKlHqs6nb1Q0ON5mjBcz18/WvPyI4M2
 g7ed/wORmv3aHNEvlM9NEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773699056; x=
 1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=g
 uCypQjfxr+Zi7JxdTC/p3wGQ4VV0q/Wv3rf4QuOSSvRwPZ4hwWoKXSQwRlJppx/A
 eTD/kX8ytMBkqeeAHXi8QojGoDJPwhemKEl1A5BQyy+VTfQ0kjCklEhRU0D9TNU6
 QzoouUhJdY7Fi24kVLMS4vkfF5Xif+sxcGuZ+ZH9bmNOAZhg/6jHFnuxjrIUYo4Y
 sJAjmQ/c58h+MsTVokuL8c2t4xBbVGwnTgXIvKplEwnaY81NNzKXbPGa+zPU58N/
 vwQ/zZfUYT5zYdyXfBWrfC5sZSkqzhpuD1WACxXIM/TD7Jh2N1ZXy8qS+O1DtSBY
 h24uS6YuZ9c79L+rKNYRA==
X-ME-Sender: <xms:73-4aYdtUUIQC679P0YPl8k6UZ10Tz8-qTD319yDZEtXusdBhZuXRA>
 <xme:73-4aTUav9FvduIIOmc0jldmINr5W_MhUsWQFGzP1fBm1dpf8ggOxSMvCMHniLmCu
 LbRPk360ujIo39hLA6fsP95YlnCLki5WcrUsiuRyEwh6NcxWlxF>
X-ME-Received: <xmr:73-4aSY56rJyFtQwMFw-H9dfM29zbbMWxWkWrpi3kYaZ1kbqDyXdf5bHU5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleelheegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesthejre
 dtredtvdenucfhrhhomheptehlvgigucghihhllhhirghmshhonhcuoegrlhgvgiesshhh
 rgiisghothdrohhrgheqnecuggftrfgrthhtvghrnhepvdekfeejkedvudfhudfhteekud
 fgudeiteetvdeukedvheetvdekgfdugeevueeunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhgpdhnsg
 gprhgtphhtthhopeehhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhhrghh
 nhdqohhsshesrghvmhdruggvpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfh
 hrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrphhprghrmhhorheslhhishht
 shdruhgsuhhnthhurdgtohhmpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlh
 drohhrghdprhgtphhtthhopegtvghphhdquggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopegtohgttghisehinhhrihgrrdhfrhdprhgtphhtthhopegumh
 dquggvvhgvlheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqdgu
 vghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepgh
 hfshdvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:73-4aQltNdDVIdEqvCmz7Mlt0qW50NA4CHgJQUMNlacMN4MGiVKHfA>
 <xmx:73-4acHdFw15OLpR73_B1AdIXJMG-pYssiD_C0T2dj2N-8ux7fVHFg>
 <xmx:73-4aU6P6J2BtdvPwSPzfrUNjz9-qYacHOOWBucSAMlha23fXDTcIg>
 <xmx:73-4aaO5YEqAXlnOLRO88GZx1RbxPW8QtXAeqZQNaqmxlgOL7PgFkQ>
 <xmx:8H-4abIvs_QYur641c9BpnDuFQ6ssCC-7-o-rPLEHWyRxStBDxJEr6SL>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 18:10:52 -0400 (EDT)
Date: Mon, 16 Mar 2026 16:10:50 -0600
From: Alex Williamson <alex@shazbot.org>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
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
 alex@shazbot.org
Subject: Re: [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <20260316161050.01c82973@shazbot.org>
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 Mar 2026 08:18:20 +0000
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
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[shazbot.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_SPAM(0.00)[0.992];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,avm.de:email,shazbot.org:email,shazbot.org:mid]
X-Rspamd-Queue-Id: B6BB72A56F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 12:49:12 +0100
Philipp Hahn <phahn-oss@avm.de> wrote:

> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct vfio_device *device,
>  
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device, mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
>  
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 

As others have expressed in general, this doesn't seem to be cleaner
and tends to mask that we consider IS_ERR() and NULL as separate cases
in the goto.  This code looks like it could use some refactoring, and
likely that refactoring should handle the IS_ERR() and NULL cases
separately, but conflating them here is not an improvement.  Thanks,

Alex
