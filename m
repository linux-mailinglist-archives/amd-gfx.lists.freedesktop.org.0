Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D9A712D9
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Mar 2025 09:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A28E10E68E;
	Wed, 26 Mar 2025 08:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="GOhtQcQe";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.web.de (unknown [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1AD10E32C
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Mar 2025 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1742944957; x=1743549757; i=spasswolf@web.de;
 bh=gY8B9GBQL9nUHTRbQamIZos1rVDULEBsh1sN+fH5oGo=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GOhtQcQe8sat3+iobd73xdx1RHz8WbkQHKOw+JPg+WeIy5pzxIC1FMKR+HdDzS0z
 PLNNBFgeNweYRmcSF1ISyUE7M/UBb4vFt+jnNXkj70KEqyBu+6wHf0zxurT9vurso
 Zq2gsGhweS7dJTkR205cYlHF60o8ky4HjibDv6lMauOMorRkfDrJO0mVvPWvf7GlO
 Ze590lN+3cEyeXagF1BHr4uKSdrVVqPm9oGGtPOPHAsMR38HV3RhtC1HKgITBxvWy
 AP4WOkoLSt9N8YIQcmU+Pbf1+XseUylUZV5rd+jMsQzx256BV06HRWJ0HPldZ2+jM
 Mrh/uv2Ql2r+7wyGwQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myv72-1tASSt2Ayo-012jIk; Wed, 26
 Mar 2025 00:22:37 +0100
Message-ID: <eb041c610719c8275d321c4c420c0b006d31d9f4.camel@web.de>
Subject: Re: commit 7ffb791423c7 breaks steam game
From: Bert Karwatzki <spasswolf@web.de>
To: Balbir Singh <balbirs@nvidia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>, Bjorn
 Helgaas	 <bhelgaas@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Alex Deucher	
 <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, spasswolf@web.de
Date: Wed, 26 Mar 2025 00:21:53 +0100
In-Reply-To: <261e7069-9f65-4a89-95cb-25c224ff04f1@nvidia.com>
References: <20250322122351.3268-1-spasswolf@web.de>
 <688f2757-e364-45db-ad54-daa6ff1c4f3c@nvidia.com>
 <6e8ad3cd27b570aaefd85395810cc90bb3120734.camel@web.de>
 <7cdbe06c-1586-4112-8d27-defa89c368e9@amd.com>
 <b1d72b95-5b5f-4954-923f-8eebc7909c4d@nvidia.com>
 <938c2cbd-c47f-4925-ba82-94eef54d9ebc@amd.com>
 <261e7069-9f65-4a89-95cb-25c224ff04f1@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VOOYiLoMShOoiud3+Nvf9dJHlrBFUOfbXbOX2rAweYFMDUO3oAl
 yKiaZIcoBV8/mMfnmn5wQQ35A+U8QrbCBKyJ/dXxNwu91KbBIqxv48wuGXoI+bjspavIeX3
 UOzGW1SCHtaVCHbtc25eupk/bGDTFpD+GgUz714Cz4AhBX7INVs1MIffJVHHEwt36NILool
 uWQkN1WzGzDZwlgnbnsyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2gzskj2BU/o=;d0gTqL3GqAmtRzdUT0j+Q8tFfVa
 5GFu70rSv4eYkvN57UrTXRSqslZMW9JGjuRHOFlFuY69+SVcQI2BbHw1dLyLSs39fBPgEgdvC
 IvEm13d6IOsjd/CejCXteFVFm3HdxkLa8SJovOERPNZsYNXOYT5Oy7HpjN/IYPflIEG7bcvAf
 jm/KoK9QFrDxWMRQqRHp6u1zQXnhuqH5O/0IWeKoiObP+YVDVA+cwyY4IQyWXjA/GulNBPhNY
 CrNwNwoR/UF/N756AUAF/xnRItqcm5XBQA1JFmuFVmCZka4CjiSSPRtmaEGj2l9b7OAV3MSNV
 0YnYVDcP87tMYd6m+zFUTyiRaVhTtXdYacznSgdUIL0jmFX7PWDn5kB5sHyqb9sSOgUoZfqLw
 nAkMhMKzsZHZ7ft8kN51cwA6Sh/G2G3hb/Wy+j+a+RkKUujlC3xCQIQ3BVhypov3x53kto4Kb
 dU5m0qDWfrcrf9SpSVTNwb6VSQHxfvRd8cNw+YPpn0V7EmXkfEehGAyVnpaQxnb4EPfScmxFq
 OIcKbT+9VK99gpddxPqiU7uORHU5KxNlHG6uyU759jFFVUFkO3aDxjrIIavygKcyxmYOrv5dC
 DUI9oYEZxNvYMXnP1EtiIFSzvfBuO/nd45bcfJjGHgTC2yjAwkf26t7O98BEgeCXtlCkXQ2Hy
 Gb5BTMI5/k/saueIpWUQNug9bHgaMIkN2pgxQJcb1xKD+XVR+ZqudHcPNiOSEe0psQU2kyf6K
 vBu2gouMqadEab7y1BOEexKmeL4nJGZ3JKhTVSN6xwCC31BH69VsVwws9e50p+Rlhk112sxJB
 02ubfgMZvAayDCpQ+tL9mkjA3v2v5QwuaogpY8q0+o9ff62Okaq+srqUOADzO0WHF0hizOZUW
 VDJu42qbf52SYTo3NT6nq8EzrXSEmXPO8XW/A0Ll6zR4ZzZdu260wBjcHRoTilX5M4w4GVNKA
 i2aMsLxuZyAsHfjvp8yUQZDNIvURH0uFafRN+h+VMvXa6PeezI0YaanYcY09ZsJEw3LZs/tuW
 tra0T/L0htAeUYIwc5/Zw6eGF6LgnLYpVnbOTi2rcPPZF1DtzbAmDuaeVSj0CFqnU0epHisvg
 YsaRp9M7esKX9xRuoXITpp3EXgftMBj5AAK9iQqzGEOl7AeV0/5xTOH/mRPD21Zmj+AjImnj5
 ogfRMam0cnOnI5qPhL1rtxEbzyRSU4x0rE7FGHlK99G+LHAI+pUpitKDPqHbd2Qz7u4o4F4al
 xTNPgyyltbrgnDNVdkmvlXitGq/EKWlX9RjC/6q8fLsO4pJNLGJte6wMLEb7WP7eQHL79QG/i
 3IMKj2a7W+CKpeBFtjfu6DJDPWtZfibdIwzKupY+nMnW7Jgyk0w6BFBX/16aXwluTmyujVuG7
 hC3xDOmU9yZ5O8ps1GgmWexoocTwuQpy2ZGraX1J91hwILw8oIV6VNerhQz/szxbGakHoiFs6
 1G26J0d0BzTtwKsbAmoYa236XlEQ=
X-Mailman-Approved-At: Wed, 26 Mar 2025 08:39:53 +0000
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

Am Mittwoch, dem 26.03.2025 um 09:45 +1100 schrieb Balbir Singh:
>
>
> The second region seems to be additional, I suspect that is HMM mapping =
from kgd2kfd_init_zone_device()
>
> Balbir Singh
>
Good guess! I inserted a printk into kgd2kfd_init_zone_device():

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d05d199b5e44..201220e2ac42 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1049,6 +1049,8 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *a=
dev)
                pgmap->range.end =3D res->end;
                pgmap->type =3D MEMORY_DEVICE_PRIVATE;
        }
+       dev_info(adev->dev, "%s: range.start =3D 0x%llx ranges.end =3D 0x%=
llx\n",
+                       __func__, pgmap->range.start, pgmap->range.end);

        pgmap->nr_range =3D 1;
        pgmap->ops =3D &svm_migrate_pgmap_ops;


and get this in the case without nokaslr:

[    T367] amdgpu 0000:03:00.0: kfd_migrate: kgd2kfd_init_zone_device:
range.start =3D 0xafe00000000 ranges.end =3D 0xaffffffffff

and this in the case with nokaslr:

[    T365] amdgpu 0000:03:00.0: kfd_migrate: kgd2kfd_init_zone_device:
range.start =3D 0x3ffe00000000 ranges.end =3D 0x3fffffffffff

Bert Karwatzki
