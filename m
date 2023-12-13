Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917080EF4B
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Dec 2023 15:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC310E62D;
	Tue, 12 Dec 2023 14:49:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:242:246e::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9D810E105
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Dec 2023 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=sVUr0dBPvE4hjj2hRHA9dzust08BK20shWiG7p98Mdo=; 
 t=1702374416; x=1703584016; b=W9CG72uGRZb0/h6Whij0HnNzpV5ckaTzglZF+9VWakYGTA9
 mkmDL35hPAMnJwR0zFpp8FK6pY8r4UPDStv3NYvoisI4apISBr2GUvPgP+NooTltvUQ0hC33VZ0P4
 td1LNtQdJg4vIrqbs3eF8Gajse6NAr70RvlksBHyUggkUxGeUk3+8yGt6tL8xw/auDGbZYp6j9/ks
 QMmJ7OrZ77gy2wQugi7ZFgw4MzyB/HKHjL+sVOAk97MPmpaptRbsOgxpK4C+5CNyNBBDc1Oi+UADd
 lqGF8Q31S/a+bXS/UhauvjcIRRQjpS3IRLHLGdM6Lqid7bRAbNqECjywDG/5CAKQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rCzLp-000000084TA-2X0d; Tue, 12 Dec 2023 10:46:53 +0100
Message-ID: <3a06ae67808800386117c90714637ef9a0267b37.camel@sipsolutions.net>
Subject: Re: [GIT PULL] mmutable branch between pdx86 amd wbrf branch and
 wifi / amdgpu due for the v6.8 merge window
From: Johannes Berg <johannes@sipsolutions.net>
To: Hans de Goede <hdegoede@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Ma Jun <Jun.Ma2@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Date: Tue, 12 Dec 2023 10:46:52 +0100
In-Reply-To: <6395b87b-7cb6-4412-b6e5-e6075353fb6d@redhat.com>
References: <6395b87b-7cb6-4412-b6e5-e6075353fb6d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Tue, 12 Dec 2023 14:49:31 +0000
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
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 2023-12-11 at 12:02 +0100, Hans de Goede wrote:
> Hi Wifi and AMDGPU maintainers,
>=20
> Here is a pull-request for the platform-drivers-x86 parts of:
>=20
> https://lore.kernel.org/platform-driver-x86/20231211100630.2170152-1-Jun.=
Ma2@amd.com/
>=20
> From my pov the pdx86 bits are ready and the platform-drivers-x86-amd-wbr=
f-v6.8-1 tag can be merged by you to merge the wifi-subsys resp. the amdgpu=
 driver changes on top.
>=20
> This only adds kernel internal API, so if in the future the API needs wor=
k that can be done.

OK, thanks! I've pulled this into wireless-next, and applied the two
wireless related patches on top.

I guess if AMDGPU does the same, it will combine nicely in 6.8.

johannes
