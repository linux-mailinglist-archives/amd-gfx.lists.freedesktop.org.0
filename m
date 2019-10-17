Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43DEDB027
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 16:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82C96EAAF;
	Thu, 17 Oct 2019 14:34:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE7D6EAAF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 14:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UttJ696FffEYaFXIhBNDBIFhuo7zAmBE7CD9UI68p9zLgCvlgBbd0T0CB8JP5ti1i5KiIwBXhsBGZu7KkA1aEGJ76qEGZ6k3BQFTyHLNDWLr6eOpwc546Wmeq8bAhz1G3D8FDfWUaYq818UDBV8L9116lBdT0iqwRi1rD22iKtWP3iBaZlATLqtJg/iAtBFgmXRGjuGJXHX6WmRhLf7WYBzD7qu2XXbfMyPlL2N/0V5bMPFzC8kTDQr5QOh3R19+FbpkVFtgCQgctLbP8HzSmvQejR31hz0jQq/OdJCPuc0JD0aS/6aQTnpHOXihvskNHLHPqaKy9Q9XLgtj0Uso1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMY5QTnHwEjhGIHNOxUPRuMfoC/Y2EhYSIY/QNcEdCo=;
 b=B0PcoArlULbVVjsKX+aBWuBpMBZHVxMjvPxkDROE47wAnnC/77zBjW4TWFwDdikUhH3soFYjBys1K77BH0ys5L9WOjmQZjjDIbaHgnHFj8+3qGIRVvKWyUsbP2qmCwx+OF8ryX77xOskcX1ktZ6jA0MMhPJOHuwDV1PWzz+3TwsbyQqWv/A8gc4nd1m2bVJq5PchEJb+4dMinKHXPUatn/Wr5bpxqv3y+SH7TcfOTnLb++T1zcnh3OQUDRxolwiofC0VEUSO+TtmfXJ0Y45HksnC2OJxZbWrUFgdHs7LBhtmFIM0DowlPJV32AKbuzi+BZg8ddfLIi08zLFy2qodyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB2987.namprd12.prod.outlook.com (20.178.29.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 14:34:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 14:34:38 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "Liu, Zhan" <Zhan.Liu@amd.com>
Subject: Re: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Topic: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhKHEf7z6O+vtZ0KYLzN3Nfjkz6de5rqA
Date: Thu, 17 Oct 2019 14:34:38 +0000
Message-ID: <20191017143435.qncwbu7tawqyezw7@outlook.office365.com>
References: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0311e3-d3cc-4406-ed01-08d7530f23a8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2987:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB298784BD5829044B5C6D4CA2986D0@DM6PR12MB2987.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(76176011)(229853002)(11346002)(25786009)(6246003)(6486002)(5660300002)(99286004)(2906002)(8936002)(52116002)(86362001)(6512007)(6306002)(9686003)(66616009)(66946007)(66476007)(6436002)(1076003)(71200400001)(71190400001)(66446008)(64756008)(66556008)(8676002)(81166006)(81156014)(6116002)(446003)(3846002)(102836004)(305945005)(256004)(26005)(186003)(66066001)(316002)(14454004)(7736002)(966005)(4326008)(486006)(6862004)(386003)(6506007)(476003)(6636002)(99936001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2987;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8v3G4PRn1tkRfjPaw9gCLPaYXnJs551UybNhg4gcivImREMGbK73aCMRr8z33Enc3jYOt6wGugwYR4YQSlEM/LO3gnshL6Xj8bYsW9KmMubABlXHRNXBrzWXoN6DLWCUjpsxX5rRJFOBNDN7AbDqEgTlD5ux8+VOMWDHTfzSqxVzXCjws+L1n9XkWcHlEUPPEXX3XMIoqaIrqwbhWNcY5vfjeZt15dZ2TRvrvk+6NNuDS3c5CEsXjytV1D2EtT5pUtm35Ntt4Hl9cOQ3/jm8LLsh9uytMCyrCus1g+gZdqb9hBkwEuTVMA1zxmyygCtdjNhtdD6xDUoHfluJZRQ4cXSAqzZJc7GDQz3Aj2F8d8iYXpq6bfFLwH/qcJyZlTmH2/jiyJ096U+0g4jMgUifpRdQ1ypcjlCS0cq8ZrSokQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0311e3-d3cc-4406-ed01-08d7530f23a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 14:34:38.6611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxNZyRwfTgkrafOcF2COf8wN9pdZDwC1xtpJmUo8wFsd1SOumFcDHT6O6Us7VZoyk9Viqkm2HHbgNA/5yL+5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2987
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMY5QTnHwEjhGIHNOxUPRuMfoC/Y2EhYSIY/QNcEdCo=;
 b=K5iLHIuJOjkvvbAJjE+h9eYFUhMqutOl5IrGaq+Dy3qtIgVRYOK5N2bEETWQu4oAhnjpjCmDtwQ/Qusswgi4K44yVtYB98cOimXl8gwbC+fU1bvAMgJ1hJc7xI7XvawRYL59tBAasVPDVdxMaFXDVurpjPb3GsKuaIDkXk0nQaQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1825230968=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1825230968==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evzostl23fxpgfaa"

--evzostl23fxpgfaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zhan,

I tested your patch, and it fixed the issue. I have some notes:

1. Your patch does not apply smoothly, try to rebase your branch (I
manually fix it for testing your patch).
2. In the commit message, I recommend you to describe the "pink" color
issue when using HDMI. It is going to make easy to understand the issue
that your patch is trying to fix.=20

Thanks

On 10/17, Liu, Zhan wrote:
> From: Zhan Liu <zhan.liu@amd.com>
>=20
> [Why]
> When a specific kind of connector is detected,
> DC needs to set the attribute of the stream.
> This step needs to be done before enabling link,
> or some bugs (e.g. display won't light up)
> will be observed.
>=20
> [How]
> Setting the attribute of the stream first, then
> enabling stream.
>=20
> Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_link.c
> index fb18681b502b..713caab82837 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -2745,16 +2745,6 @@ void core_link_enable_stream(
>                         dc_is_virtual_signal(pipe_ctx->stream->signal))
>                 return;
>=20
> -       if (!dc_is_virtual_signal(pipe_ctx->stream->signal)) {
> -               stream->link->link_enc->funcs->setup(
> -                       stream->link->link_enc,
> -                       pipe_ctx->stream->signal);
> -               pipe_ctx->stream_res.stream_enc->funcs->setup_stereo_sync(
> -                       pipe_ctx->stream_res.stream_enc,
> -                       pipe_ctx->stream_res.tg->inst,
> -                       stream->timing.timing_3d_format !=3D TIMING_3D_FO=
RMAT_NONE);
> -       }
> -
>         if (dc_is_dp_signal(pipe_ctx->stream->signal))
>                 pipe_ctx->stream_res.stream_enc->funcs->dp_set_stream_att=
ribute(
>                         pipe_ctx->stream_res.stream_enc,
> @@ -2841,6 +2831,16 @@ void core_link_enable_stream(
>                                         CONTROLLER_DP_TEST_PATTERN_VIDEOM=
ODE,
>                                         COLOR_DEPTH_UNDEFINED);
>=20
> +               if (!dc_is_virtual_signal(pipe_ctx->stream->signal)) {
> +                       stream->link->link_enc->funcs->setup(
> +                               stream->link->link_enc,
> +                               pipe_ctx->stream->signal);
> +                       pipe_ctx->stream_res.stream_enc->funcs->setup_ste=
reo_sync(
> +                               pipe_ctx->stream_res.stream_enc,
> +                               pipe_ctx->stream_res.tg->inst,
> +                               stream->timing.timing_3d_format !=3D TIMI=
NG_3D_FORMAT_NONE);
> +               }
> +
>  #ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
>                 if (pipe_ctx->stream->timing.flags.DSC) {
>                         if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
> --
> 2.17.1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--evzostl23fxpgfaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2oe/sACgkQWJzP/com
vP9z2g/7Bewf93NmUOMsV+Msu8XBmkX2LPd2yd307G5+HH3fYy2HmSmjC+R/fVDg
H1Wb9oNymre6Ww83FJrDahGzN9uQEaIDgdNLM51hS2YlwbPZGK2dN9dd4HEjYT9/
9FnhuYKhgJ2yvjGXGmWcnzlVV/thTw65N88a/f585KZiW8TR8AkBymu+DHtZUNmB
xF1DGdZmlxzBOqu2eYKrcRrtO7deYWrCkCHGO/aTzORNtBWBKd+3eUoIPgsspV74
AwshcxesAVOPQETVBNBi9KZ74rQNT8TMX9V+mtuFjMF/ntDKyMpPTfw4yOpvWlID
ul9KlbzHMbryiBabq0uPM7BqXWV0jIzPI+/YaxHdluBc4DA9QCHFQJOxHrfsE6So
W6fEqhikibITN4WKOpjoioZNqzNzseD5CF+K4jFQMjBBpSZT0DpL5n767fonJqF6
YJsm+tSI3RAI/QGsK4A0+Cjrit8q4ltvd8miUGyO9zMfcs8etR6jMfSb8pb930e4
cBNueSuIYMUQfBHRC2wnBaZrRQoos9C/Y2HZtsZfQCP+HXzpRuSftMCkR4M77uw1
T9UuJABajiRVFKQb113Za636amPN1KsOobrY6jDvWJLEPfgrtAvOCFG7sEfsBy/z
IgvaH9/C0sl0uX9BUiJMMRu5U6VWqcY/BkFQrqPenHqrFnUVvqs=
=pQSp
-----END PGP SIGNATURE-----

--evzostl23fxpgfaa--

--===============1825230968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1825230968==--
