Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AF736410
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jun 2023 09:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A410E271;
	Tue, 20 Jun 2023 07:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707B910E207
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Jun 2023 14:42:27 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 733243F72F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Jun 2023 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687185743;
 bh=oVzx6NYhYUEvG3AH2qaIIGghMLVni7wi0TtZ3p4soSE=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Ae/+RKrmncU9myeHSwFon3FOjr/GFaTPOC1mTLEZfr0DLSXYCwLpmzUeUW+5JM1/P
 67ECXxdxZZaYDiYzGqMygpX6ic7JYE8e0fIPWEsnBs8Id2KEMdis1qOL4/EGhem7fE
 rnsWq9imjssAlh9U3+cQLoE2iR7shVlCraWRO8ZG+ylnM9kSn8cbEhRHI99yjKXH3q
 NQBwpzpnMRqxn1wVnCY09+T452b2X2JosqqAKadiEUH/wYqhRKjNraM1JBYjTw9I2n
 aBo6nIdvSvw2SE0xNFsShuc3dtAO6WLjBkWykE1lVCPwSMxy3ChBCVjc0GPwrSlLbI
 X9NOhGRzHe6jA==
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-98864f473c7so98523166b.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Jun 2023 07:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687185742; x=1689777742;
 h=mime-version:organization:references:in-reply-to:message-id:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVzx6NYhYUEvG3AH2qaIIGghMLVni7wi0TtZ3p4soSE=;
 b=DQvjQ0yXSB/vCik8l1Ps+PRs9IHiAA6eMYbxthz+1/WJFm0VN2u/oKYeKZ91W4TNgF
 oh7NSBJcLsO7NZ3TrWufOW8aGxMDt1Oe+T6KJl9i0nBCzI2rU/Kbrkol5NL5IRiU4WzX
 RR9AnCR0BIEV2Z33/NRgk8k2AWnyaZ+gvEu0UWvp/oJps8l68/uGzQ74Mo7hzmRASeud
 a4IoD5OWXp1L1iF31SL9YnxBW03f+ybTPaGCxq/VZsQXM9qukx191AjZ8YtOFxdto4av
 FMMKybxGu+k/18hbCWy7YxMxPjHyrYd6OM/8FEtmwvRdm6le6bMzw8DJQUN8m2k3Ee30
 qJ1A==
X-Gm-Message-State: AC+VfDyuXd7bQBbJKR4F8eeHIXZtM7tfAVjZw9GFjz78NK16X9cRoSgN
 N1buC0p5HdKOg/At/0n0JH5AzoT7RdLSAf1KCDHYUfDFBnU0MVYxEljnmTwj9EdU7nlHQxBLRz/
 vI6VxnU2ACVLmNS/Pabt1SrbvyXXTgBqqAk68pLFi5pRr/V/fePgttA==
X-Received: by 2002:a17:906:4fc5:b0:974:20bd:6e15 with SMTP id
 i5-20020a1709064fc500b0097420bd6e15mr7712248ejw.4.1687185742796; 
 Mon, 19 Jun 2023 07:42:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uRvfrz4OGRcv0QxkR+P4tDg9wB7UCd8/6nh/dPpJc1WEhB3DIXye/HmnDc/eWXtbGoz8M8Q==
X-Received: by 2002:a17:906:4fc5:b0:974:20bd:6e15 with SMTP id
 i5-20020a1709064fc500b0097420bd6e15mr7712224ejw.4.1687185742517; 
 Mon, 19 Jun 2023 07:42:22 -0700 (PDT)
Received: from gollum ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 bn14-20020a170906c0ce00b0095807ab4b57sm15016341ejb.178.2023.06.19.07.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 07:42:21 -0700 (PDT)
Date: Mon, 19 Jun 2023 16:42:19 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add missing MODULE_FIRMWARE macro
Message-ID: <20230619164219.4ae6a818@gollum>
In-Reply-To: <CADnq5_Nnr=BO2y3O3_x+sX-93CtY7g52m9DHva7WWqeeO5xqMA@mail.gmail.com>
References: <20230616121116.1031336-1-juerg.haefliger@canonical.com>
 <CADnq5_Nnr=BO2y3O3_x+sX-93CtY7g52m9DHva7WWqeeO5xqMA@mail.gmail.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VSLr7Uc977O.nGCK=PDUW7X";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Mailman-Approved-At: Tue, 20 Jun 2023 07:09:56 +0000
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
Cc: lijo.lazar@amd.com, Bokun.Zhang@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 YiPeng.Chai@amd.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, Likun.Gao@amd.com, Hawking.Zhang@amd.com,
 airlied@gmail.com, christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--Sig_/VSLr7Uc977O.nGCK=PDUW7X
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Jun 2023 08:53:20 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Fri, Jun 16, 2023 at 8:11=E2=80=AFAM Juerg Haefliger
> <juerg.haefliger@canonical.com> wrote:
> >
> > Add the missing MODULE_FIRMWARE macro for "amdgpu/fiji_smc.bin".
> >
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 5c7d40873ee2..1f83a939d641 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -92,6 +92,7 @@ MODULE_FIRMWARE("amdgpu/picasso_gpu_info.bin");
> >  MODULE_FIRMWARE("amdgpu/raven2_gpu_info.bin");
> >  MODULE_FIRMWARE("amdgpu/arcturus_gpu_info.bin");
> >  MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
> > +MODULE_FIRMWARE("amdgpu/fiji_smc.bin"); =20
>=20
> This is already specified in smumgr.c.

It sure is. Sorry for the noise :-(

Thanks for looking at it.
..Juerg

=20
> Alex
>=20
> >
> >  #define AMDGPU_RESUME_MS               2000
> >  #define AMDGPU_MAX_RETRY_LIMIT         2
> > --
> > 2.37.2
> > =20


--Sig_/VSLr7Uc977O.nGCK=PDUW7X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmSQaUsACgkQD9OLCQum
QreYUhAAnmXAhO0Tsu0xyykMZZdNzq88fuPv5q6L9CFkZYzPfZouX8irTOMyGuES
vbrn1ZzVf66SzygqILzCkA2nH8sLgGJSF5S7t8yhtjrWsgLBXre88Exe/3RKyl9g
W/zKNzlOlINUo3fm7bfvM+pZl/OKxVtfq2IbgaD/rk5LyFbl17Z1ETTA2TBY9P0m
U4dpQ0KySNknwxEe6l8n3S9oJJzuaw5z0rgd5opwtv5RKFXZQUcQ4i8FcSfNCb89
ciY/SdcRlybfyQ9tlfToOkSLnOkzMlMcmGX9LtiBvZTx6dvKfqd7xqy8p/+8tFTE
sn1icmhV5zvLEyWs8eI51DwwpmK5BlAHbfDsjOfgOjc8r+OsarW5IpF2G8eP93oR
tryuZx+kD1OcBd9jUiEyuJGC4mcYHNndwPniCjxP3OcKWhJsia2V8axHYZ//ddf7
NfWFg6jE+M4j7Nl0C2XWq8KO83ejkSR7N+siPs6pPKUdHTKacJaeO/5ZBm7y0rRx
3C4b335jx/uY74nBrW9WtJr+bOZz2YPTM4GOl6rOqsjy3LmzYt6kpFDYeTUYWoKW
4uj3jRf0257eeaXjCL2kdNS4paQT0Ipil3kaSG1Ea32OyW8+ipqmg7nwuVkEifOx
q4NmF4Rkmx1Q2enwGXRwP+PaXa4a4qe2OuSyzKEYG8IUyxITxFU=
=i1ZT
-----END PGP SIGNATURE-----

--Sig_/VSLr7Uc977O.nGCK=PDUW7X--
