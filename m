Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLLYGlF5vWkA+QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 17:44:01 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACD2DDE2D
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 17:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECF110EC0D;
	Fri, 20 Mar 2026 16:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N74HNX4b";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8A210EBFC
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 16:43:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 698384E4274C;
 Fri, 20 Mar 2026 16:43:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39C08600E0;
 Fri, 20 Mar 2026 16:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0B7810450CB2; Fri, 20 Mar 2026 17:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774025021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mYNuIL9yId09WjptvvKYSf8bf610PowqD7OK/zNQYqY=;
 b=N74HNX4bTptZKAGXOFycCeCrtNsYNUWp4/1c7qOZtZ4kHnX7YqvzQJCIUhMmAC/uaThYx+
 qrTqgotiTx+8ydkFAyQEFYiGwiYwxWRLoh7uHGLHCAyCA0bMDR4J7CHZoh6ZS0gajh/K2X
 3Ktfi7TzwVrautHxjCLOnUAP644iwviAM1QTJnXDfg8EVom9l4dwtiecP8cKhsPpdletci
 S4kbLpj11ptSlFz62j+PifPO5Z1hK9O3CqCRUT6KFyKza55DPMzhtoHrHwCMomJbez136N
 bFHkSyvJ827Tyt2IKCbx8ajBCc5WfCmmyhi5r6ekPYlzu1g6d3+ZNzRCl43WLA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 60/65] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG
 un-BROKEN
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, mripard@kernel.org, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, 
 christian.koenig@amd.com, matthew.auld@intel.com, 
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
In-Reply-To: <20260313132103.2529746-61-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
 <20260313132103.2529746-61-jim.cromie@gmail.com>
Date: Fri, 20 Mar 2026 17:41:54 +0100
Message-Id: <177402491478.6181.1346005469829325170.b4-review@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=476;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yeS4y+WMHxZwLeHWBUsM7zWsCPYI7FDza/++wcXC7yQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpvXjb1MsOk2TyzdfTgAtSh2+5mexAzH9mwVfCi
 hduMkLo+YKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCab142xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJkKQ/9GFUv32TJsCzbk+LxyZd3JKbtf5/zRrJ
 g4l3e53GgEZ6CY7JV8lqkXBYwNdizgE2UYMgwl6uYT+hKjRCj97WikZPJS0vbzk1C5sEwsrHUbN
 aLRGuoBqC7BrCCeY/s6I7wOTrh2aPJTJc+VfAzabPA+uc0qucstShgm6BXYYZGvwE1Cz7evVJ6x
 wdCuthwmxEpSHJxtyfuZD47f6IxRK23d9u9e3GSsewSv1Y5A6VurCv1Ye/R1zKxW02PmdsaFfmh
 yovIo4PvK+iAi/uy7Bkd2CLTpfRkzgOKRGXGN/diFsAD/D/Qw4oHE8JLeR47vW8yfceL13TM4ii
 u1+q1FyXVpHA4/vcVWUxsForb6DbA8Wo+GmwiZPTt2ojN5Csk4CiW4EQmSdBaZrCir9Nv8GMoHv
 4PA8aNUyIsNQenkDADhIA5/YQ15xl+FuLTbKIBF/tRzIxwbfVyg7PMzy3qhwE2Zn2S54xbA0eFx
 bwrtwxsCB5sOfVbi+zulAnTOHAL7D9K1rhJRv4UigJFAS2cONyJ8/snHXKqV+BR+ZFsNmaGaIOe
 VDk2j9sIYPkh+33DlMNzKkyBJGCQgDa9R8GdTB3Ij85jmErpNr/CWVgOt2tP2qH9cb2fHMF3HSE
 QngLGVe/LP70d788BtA1RstsTkF98NPu72Zp2aCCK3zG74vjeXxk=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 40ACD2DDE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 07:20:25 -0600, Jim Cromie <jim.cromie@gmail.com> wrote:
> Time for some thorough CI.
> 
> Also, the previous 18 patches could perhaps be replaced by a single
> invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
> drivers & helpers.  I didn't find such a file, nor a drm-client
> linkage item in the Makefile.
> 
> [...]

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

-- 
Louis Chauvet <louis.chauvet@bootlin.com>
