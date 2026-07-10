Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8riKJ06xU2r5dgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 17:22:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AF745282
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 17:22:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=VlASjWqz;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0510E4B8;
	Sun, 12 Jul 2026 15:22:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39F910E50F;
 Fri, 10 Jul 2026 20:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mbKc1/cSnSEV/apgsx5ozNRioLCTdX2qVb6//I9wooI=; b=VlASjWqzgcw0QONm2VCn9BzIJk
 mn2RdSSUjEIO5JzWmm0NECkI5oCnjfmSMQXC0ltkXJbkRdgysaJK3+O0Hj1BAFTmqQuyc96+CQijd
 ImJPaq1+68QSTSe4CVZr1+6vewHd8GF/6SfFcgMiBiKwHx49XRSSrKhVQHZ+Fup2D0lUv2libGRjO
 sgaRQmB46aZF6mbROIzJ5fwRcgCXmLJXY6cl1iWO7nMzmdx6LPQbRuV5OEesW1Pz+r4QaKiIJ9ZTa
 D+PM8H77iOfgAsWThzGhnupIr3Gcw1XxgpwacXiYkBYB4AQcIu0g/I5ob7R5PpPKivZmvq7s8sLdf
 D//CRstQ==;
Received: from 179-125-92-221-dinamico.pombonet.net.br ([179.125.92.221]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wiHRt-00D7nu-Ma; Fri, 10 Jul 2026 22:03:50 +0200
Date: Fri, 10 Jul 2026 17:03:40 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "siqueira@igalia.com" <siqueira@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH i-g-t v3 0/7] add dmem_cgroups test
Message-ID: <alFQHEiMqY2QUs4n@quatroqueijos.cascardo.eti.br>
References: <20260702130108.1397444-1-cascardo@igalia.com>
 <IA4PR11MB9251D24975F81CFD242F88F299F42@IA4PR11MB9251.namprd11.prod.outlook.com>
 <akeamIYrRSTph5St@quatroqueijos.cascardo.eti.br>
 <20260707104242.teljyquxek3hdppm@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707104242.teljyquxek3hdppm@kamilkon-DESK.igk.intel.com>
X-Mailman-Approved-At: Sun, 12 Jul 2026 15:22:44 +0000
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
X-Spamd-Result: default: False [1.59 / 15.00];
	DATE_IN_PAST(1.00)[43];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,lists.freedesktop.org,igalia.com,amd.com,gmx.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,igalia.com:from_mime,quatroqueijos.cascardo.eti.br:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E6AF745282

On Tue, Jul 07, 2026 at 12:42:42PM +0200, Kamil Konieczny wrote:
> Hi Thadeu,
> On 2026-07-03 at 08:18:48 -0300, Thadeu Lima de Souza Cascardo wrote:
> > On Fri, Jul 03, 2026 at 09:54:14AM +0000, Sokolowski, Jan wrote:
> > > I don't know if that's a problem or not, but your patches in patch series are titled as v2 instead of v3, at least that's how I see them.
> > > 
> > > Jan
> > > 
> > 
> > I decided to name this one v3, though I did not call the previous one v2,
> > because I have submitted a patchset earlier that was on top of Thomas
> > Hellström patchset.
> > 
> > I think it tracks the history of the patchset better. I am sorry if this
> > got confusing.
> > 
> > Cascardo.
> > 
> 
> Please keep versioning the same across series, if your cover letter
> has v3, all patches in series should also have v3.
> 
> Regards,
> Kamil

Ah, I missed that and didn't notice when sending. I will make sure
everything is v4 when I send the next version.

Cascardo.
