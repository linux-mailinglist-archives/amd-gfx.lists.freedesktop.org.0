Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3BE63CCD0
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Nov 2022 02:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079510E402;
	Wed, 30 Nov 2022 01:28:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82C10E402
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Nov 2022 01:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm0BFTRzZTyQHYqjt7UxcbVa+tKNBUTXrgrjj+dJcb+L2PZYCog9bZTRbK+O4A6ibIbXXWxKiK08vAJrWZm/5/wOELC9YW617Tn5kMEGGhVPjh8dwfNlIEzaPoWeCF9SB5sxQRylGGiO62mMPn4GtFTc8+Q5dngSlMQozGN1ZmBXkT2Zr9M9DkmSuSTDE78N2xV01f3Nff2xhDfXkO3stHIZd18N3nWq8mMPiOlpsReawvzM/YQCeCjp8UwHpR1ngAci1IHrYrNX9dZe95yVJIQmfF0NH4uu9wz7dKq2MwgBozJy8ZQnn6m1rl/lIyeJC42t4ORI8qvY9uTWCsDWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsMMmYYFsFlySyZ6EHRorPF4tQXBWIiTmw7ZGzhyDIc=;
 b=C1aD+NQty76TPMGRbQ84okz8QH84qAiawN01U4xFLv6CoauHtTfyhtMPegjrde88JN++lH6niRBplWj+ffvudZO6hUiGNWEDMUa6G0UTVmu8Dz4wzYWSyOnFy5LnMMgQPc569geUFRa0XV+0jdWz2UbbH3LSp4DnwBTGymPJmYDq31eMZDXaJhZQtoNiJDWhJfXdfZjAhxz89Xj5IXmvjALAhuI9olclo+vpukvwlrpNCyAo1YKtEjXug1oS7NZDrvBMb5UMi7Ax1qsKGfer1LLHPDzHddIqNg2V73ZE+XSAuwxMSqbMmptlUDcJhquZ0KYm8HokeomwAfR2IWREAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsMMmYYFsFlySyZ6EHRorPF4tQXBWIiTmw7ZGzhyDIc=;
 b=MF3s7ijmT78EIR/e2eknvBgofZpk+2u3paen8ccqlUNqxca1zHZOZCwnl2Bkf20+tEI5J56ULJlwUK3RDgxK2CElfx2E3QiXgPhAfOD5k5hOYIL3xoNO0KATL7UPKEd2brX9L49a+JgYPC368+jP4K3niUj1T53T57NfXOuUWEs=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 01:28:02 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::39a0:6c44:c6a5:cfa9]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::39a0:6c44:c6a5:cfa9%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 01:28:01 +0000
Content-Type: multipart/mixed;
 boundary="_000_BN9PR12MB5257DE1305397B439E5A35B0FC159BN9PR12MB5257namp_"
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu/mes11: enable reg active poll
Thread-Topic: [PATCH 2/2] drm/amdgpu/mes11: enable reg active poll
Thread-Index: AQHZBFTnWy+l322pjECLBqq4i8E4Yq5WrTiw
Date: Wed, 30 Nov 2022 01:28:01 +0000
Message-ID: <BN9PR12MB5257DE1305397B439E5A35B0FC159@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20221130004353.58323-1-Jack.Xiao@amd.com>
 <20221130004353.58323-2-Jack.Xiao@amd.com>
In-Reply-To: <20221130004353.58323-2-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <BN9PR12MB5257DE1305397B439E5A35B0FC159@BN9PR12MB5257.namprd12.prod.outlook.com>
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=8e6cb5af-1d49-4a66-ad6d-0fcb1a7357c4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-11-30T01:27:41Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|MW3PR12MB4508:EE_
x-ms-office365-filtering-correlation-id: a33c16d0-0350-43f2-86b4-08dad2721f1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pzp+UxSG0FLs46QVWWwqSSRm3GOY7VQlXrngFfjwduCMlAT+i2wD8Mxegb0KsHKkOhPbNqjywf8208ppNRLYPUT6svscp06zrm6TzjnfUNzG70xpBSmUH5qwcp550Lc2x363EO6YdoLkNLJ921yC7f4SnPq3EbSku2vY1YTw+LL13YGGX341hP8LwPZ8ACp0CWN2aoLm+zLXO1/OrLfM6PYJFJ7NDoeIP6eCQC7HJdSXmT540mlmcy90h14x9RpfVpsO8fx8fouYhQoTPRAP67S8rJDMoq9t0sgm/Fx1rA0dQrC44pFEW37Jyr7FjQ6uDywXTPwj0yr8QwyFPmSHWIlntEV8iWYVPwU0xmymfDE83ib2lcIMNKTmkoPlFK1CECi58/WjnYZGGNuC5EV/3rYqw9jksEVG+QX9um3iAK3eJymz+9J1zzD78C38YByjEjHZa6xU1H9a1/C7bVGGeH6HZ2BTW2vo70kGAZEqdG2WiGROFukapHpKHREVw6/7/3qajcouUldeAaaDi87qMaQZvJZ+4kRnwHsxynGXTpkXA0H6sO4v1r2GnrjBHtlNXMrqIdceIxw4ugpPuSCwhXnlaa/8+p4gEPQ2CbQk+3BS6zII2HdoVop/GrUaLH/WZYHt140oQf5dksFrzDL5angSaGyYr+rhx41If9FlR+uuIlBlTQITVanM4csqzOlQ3hE8VB9lFz7tGzbEbYDq4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(478600001)(83380400001)(2906002)(53546011)(110136005)(71200400001)(38100700002)(5660300002)(38070700005)(122000001)(66946007)(41300700001)(8936002)(52536014)(6506007)(7696005)(66556008)(66476007)(4326008)(86362001)(8676002)(64756008)(66446008)(9686003)(26005)(316002)(33656002)(186003)(55016003)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PQhShJXTbKJEib0+cczN5/Ch4UCuA0lStj0Ag5/cUL7dRyBd3KKwtvXqNPDW?=
 =?us-ascii?Q?ty2jTQfLSgWEtyHaRpktv+CzKoVIomQ2kpegXc0991kZs05nJ+2KcFxN6Aaw?=
 =?us-ascii?Q?BmGYdJzLMi6iLTyPuXFBZSkgo1Oujople7iB6Vum0D0DfgyTpu4YBiIq5gH4?=
 =?us-ascii?Q?HYPQ1BwhX9JiFhFwF/AIPkRuwI3T2/T0F5y3rz53tWKFveUN7GbqdOzgWvKo?=
 =?us-ascii?Q?ibLEts+SzSoVLy1Cd9hoNiSpRnAP9FC2/8imx6fH1ZQZvzXlqzYJCL/POGJc?=
 =?us-ascii?Q?hBj1xrwGAyzdHt1y7ugM4Jz+My0LUcYcGp9n9dtrmnr8D5ywNuIW6YkQuu/w?=
 =?us-ascii?Q?ELI6Rnjav7ysHtGmuPCJuMxV7UWTFGx4IfE0lcVty5jt+e+vDLJ1sZEjj0kM?=
 =?us-ascii?Q?Y3ii2O5e0ibZ7w98/vQe9d0qy9CM4JANYsQOM2tiJnPckoaAqi25MndY7akg?=
 =?us-ascii?Q?835UO25PD//BfSiDrgITRsebpdr6UPMrtpxA5VLcMpvuMQbzKFWN0K9UeR7b?=
 =?us-ascii?Q?h4nbWjqXJOyAW4+eaKiwG9MmGmzHTkiPBY3ZQ+nEgJ88JNjtcTAlNDx+dJ5r?=
 =?us-ascii?Q?q3W4bbynQ6csRnthUG36jfInyNjdR0UFbxx0Ed1TWj47F/ULkpmYOq9Dj00D?=
 =?us-ascii?Q?0V5fkug+5rELLQATXyk1K7BOiqYcDwBTUI2D2HMUZbymjLMwDwG/VrNTAMNY?=
 =?us-ascii?Q?cz3/T8ITotg2Hd30ROEkKQS7+4vzjKTewOoW4gEWFXIxoWzZjC8sF2X9ZqVP?=
 =?us-ascii?Q?rPPW25z9tOfTS4wcWhWwgDgJ2S8onoIqzbyzVLoQDA2/ZfYDW3406gzwwI9R?=
 =?us-ascii?Q?sznQB80wWY6UaqoRmfdaFyvCL+7dzaS2sfBKraJiY56+iJ3UtyH2mqPXanZ2?=
 =?us-ascii?Q?uuQYtsMpepdjsJX6ztriy+lRD04YkmaHDEoarOh8PLebZWdFhjqLhZffv4Jr?=
 =?us-ascii?Q?OXRrfQBrOMUGtaHEI4UHRYLoGyhCTliy6ESS7SyVMXasXx/9mX6KwuRadyaq?=
 =?us-ascii?Q?WM424BNHmTwhn7cnERTBw7ynPw9dE8p7MGvclqxTLGvuYbsuZzEuTLrL16Ck?=
 =?us-ascii?Q?Wv/dweZH/rfJy1Lj8IKIOS5vtesZXmPEy2+Lu59X0GEj3T13tdW4kesJs7R4?=
 =?us-ascii?Q?gMRUXljQScAqV6b52XhsGZsTslIzRxprxs/H9MQFsX03bJw76NJw5t7fI4kF?=
 =?us-ascii?Q?rcQkFonkbLDTLdWA0fh3oGDwmg/S7gEgD+jUD5tRqKCSaI5CwaQMeJwGGI4v?=
 =?us-ascii?Q?TxwcfU+bvdqVUhpIZvV5c7RQrFEIWXn7oUXUJ3vVEus1UHFi+zvhpWs2QfGv?=
 =?us-ascii?Q?O1B/kxh5GV/BU10KRjOYPhh1TnvyncIc2I8/GkSsO64mtKKhx+YooegMJdbe?=
 =?us-ascii?Q?FQykMWA1+QbvHz6urBQv5E+MMOOtrsJQnEN91ATYZpYRGj2yQieaGiqNw/r8?=
 =?us-ascii?Q?CkOlzguxtexNxm/du9IYRd8r1P2a87ZtFLjsN85lf2xVr4h88o9EZO3eGsvI?=
 =?us-ascii?Q?5l9V8tiPyCK4Yqrqr3xtjU5xXFyfX9zINLc7CNgAm744Nk75ZOi2u1b0Z1l4?=
 =?us-ascii?Q?HN+PMm3WA9bmUyD7KqsF+IKHpFLJ2L1JpSuYtCxu?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c16d0-0350-43f2-86b4-08dad2721f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 01:28:01.6388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFCL9OAPI0fU2RjkABN2qtb5mWL2qWDd9e6mTf4ANuCzx8NqDmoq3d7e0Loh+g5B95+ijVeaHrh7kG27yyhrnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_BN9PR12MB5257DE1305397B439E5A35B0FC159BN9PR12MB5257namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Jack Xia=
o
Sent: Wednesday, November 30, 2022 08:44
To: amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack <Jack.Xiao@amd.com>
Subject: [PATCH 2/2] drm/amdgpu/mes11: enable reg active poll

Enable reg active poll in mes11.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v11_0.c
index 02ad84a1526a..a3e7062b7f77 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -383,6 +383,7 @@ static int mes_v11_0_set_hw_resources(struct amdgpu_mes=
 *mes)
        mes_set_hw_res_pkt.disable_reset =3D 1;
        mes_set_hw_res_pkt.disable_mes_log =3D 1;
        mes_set_hw_res_pkt.use_different_vmid_compute =3D 1;
+       mes_set_hw_res_pkt.enable_reg_active_poll =3D 1;
        mes_set_hw_res_pkt.oversubscription_timer =3D 50;

        return mes_v11_0_submit_pkt_and_poll_completion(mes,
--
2.37.3


--_000_BN9PR12MB5257DE1305397B439E5A35B0FC159BN9PR12MB5257namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

eJ8+IklMAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEJgAEAIQAAADEzMzNGRkUz
QjE5M0FBNDI5REE0MUEzQUY4NzE4NDM3ACkHAQ2ABAACAAAAAgACAAEFgAMADgAAAOYHCwAeAAEA
HAABAAMANwEBIIADAA4AAADmBwsAHgABABwAAQADADcBAQiABwAYAAAASVBNLk1pY3Jvc29mdCBN
YWlsLk5vdGUAMQgBBIABADkAAABSRTogW1BBVENIIDIvMl0gZHJtL2FtZGdwdS9tZXMxMTogZW5h
YmxlIHJlZyBhY3RpdmUgcG9sbABEEgEDkAYAuDwAAGoAAAACAX8AAQAAAFEAAAA8Qk45UFIxMk1C
NTI1N0RFMTMwNTM5N0I0MzlFNUEzNUIwRkMxNTlAQk45UFIxMk1CNTI1Ny5uYW1wcmQxMi5wcm9k
Lm91dGxvb2suY29tPgAAAAALAB8OAAAAAAIBCRABAAAA3wMAANsDAADCBgAATFpGdW5o695hAApm
YmlkBAAAY2PAcGcxMjUyAP4DQ/B0ZXh0AfcCpAPjAgAEY2gKwHNldDAg7wdtAoMAUBFNMgqABrQC
gJZ9CoAIyDsJYjE5DsC/CcMWcgoyFnECgBViKgmwcwnwBJBhdAWyDlADYHOibwGAIEV4EcFuGDBd
BlJ2BJAXtgIQcgDAdH0IUG4aMRAgBcAFoBtkZJogA1IgECIXslx2CJDkd2sLgGQ1HVME8AdADRdw
MApxF/Jia21rBnMBkAAgIEJNX0LgRUdJTn0K/AHxC/AAMiBbQU1EIE9nASAOUAcxIFUSACHgbkBs
eSAtIEcYQ2xoXVxsC4BlCoEjxFIGZR1iCYAtYnk6IERIYR2SZyBaGaIgCjwlZS4l40BhbWRSLgWg
bT4jvmcLEXOuLCO1JWUjtS0qYk8FEJZnC4AiUU0HkHNhGDA7KmMjtUYDYSVAJzEtZzxmeCYwLNUl
EAhgbmPNB5BAI8AfYHMuA1AJ4EkBAHNrGJBwLgWwZ5Y+IrEfsGUR0GxmIeFEIEoA0GsgWAcwb28j
tQZgAjAlQFcJgBhQc9BkYXksB7BvGjAG0DkbsTMwMpAB0CFxMDjIOjQ0I7VUbyy3Ll/zL2MjtUNj
JUAw8jKQMKMaPDCiLjDyJy5TdWIGagWQMdFbUEFUQ4JIM3AvMl0gZBsAQi8nMWdwdS8HgTHeMSVA
CfABoB5wIAlwJcDJANB0aRowIHAG8AlQrSPLRTwvPTIgC4AgO6N6LiO8UyrQGFAlABkwZv8lEzCn
N/8niCvYOuE88RHwTi87Yjr1OylfdjvQXwIwJ2AgfCAxICvfRJZHoCIQPpEZlGQykEegFwuAEgAA
IGkCICgrKV8jvA3gASAjAC0AaQVAYe9FwUU/Rk9HUWJL30zvRyMPI7UdsRAwM8AyYWQ4CDRhMQ6w
NmEuLoBhM2U3MDYyAbDYZjc3R5AeoDY0Byph90u/T19QbCtXUE5PVW9QbARAQCMAMzgzLDb/R7Ba
wlMwWoEfYTzgR2ALgAsFQEbHXxIBX2h3Xy8JcBkgCHAuISgfYHJ11znwLMI7YV8HgioHgUomTiBg
BUbCXRhfcC8wLs8N4T5yXXISECA9R5AWIP9fr2C/YcVGwgkAJcBin2Ov9WFydRIAX0sSBJAxsUbw
+m0N0F8ncTtwECBl6ldwz2bPYTY8FF1xZ188xGFg/z+CZf9rH2FyMsER8DmwBPQ9SdFfPOAHgAXA
bdA1MPduBm4dCXB0CHA/01ymObD/aUBdMGFxbQAdwG1zaXMecA9JwweBKQYr5zIuMzcPd6AjvBVC
eRAAHwBCAAEAAAAeAAAAWgBoAGEAbgBnACwAIABIAGEAdwBrAGkAbgBnAAAAAAAfAGUAAQAAACwA
AABIAGEAdwBrAGkAbgBnAC4AWgBoAGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAB8AZAABAAAACgAA
AFMATQBUAFAAAAAAAAIBQQABAAAAbAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAgFoAaABhAG4A
ZwAsACAASABhAHcAawBpAG4AZwAAAFMATQBUAFAAAABIAGEAdwBrAGkAbgBnAC4AWgBoAGEAbgBn
AEAAYQBtAGQALgBjAG8AbQAAAB8AAl0BAAAALAAAAEgAYQB3AGsAaQBuAGcALgBaAGgAYQBuAGcA
QABhAG0AZAAuAGMAbwBtAAAAHwDlXwEAAAA0AAAAcwBpAHAAOgBoAGEAdwBrAGkAbgBnAC4AegBo
AGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAB8AGgwBAAAAHgAAAFoAaABhAG4AZwAsACAASABhAHcA
awBpAG4AZwAAAAAAHwAfDAEAAAAsAAAASABhAHcAawBpAG4AZwAuAFoAaABhAG4AZwBAAGEAbQBk
AC4AYwBvAG0AAAAfAB4MAQAAAAoAAABTAE0AVABQAAAAAAACARkMAQAAAGwAAAAAAAAAgSsfpL6j
EBmdbgDdAQ9UAgAAAIBaAGgAYQBuAGcALAAgAEgAYQB3AGsAaQBuAGcAAABTAE0AVABQAAAASABh
AHcAawBpAG4AZwAuAFoAaABhAG4AZwBAAGEAbQBkAC4AYwBvAG0AAAAfAAFdAQAAACwAAABIAGEA
dwBrAGkAbgBnAC4AWgBoAGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAAsAQDoBAAAAHwAaAAEAAAAS
AAAASQBQAE0ALgBOAG8AdABlAAAAAAADAPE/CQQAAAsAQDoBAAAAAwD9P+QEAAACAQswAQAAABAA
AAATM//jsZOqQp2kGjr4cYQ3AwAXAAEAAABAADkAgKZD/FoE2QFAAAgwKsKi/FoE2QEfADcAAQAA
AHIAAABSAEUAOgAgAFsAUABBAFQAQwBIACAAMgAvADIAXQAgAGQAcgBtAC8AYQBtAGQAZwBwAHUA
LwBtAGUAcwAxADEAOgAgAGUAbgBhAGIAbABlACAAcgBlAGcAIABhAGMAdABpAHYAZQAgAHAAbwBs
AGwAAAAAAB8APQABAAAACgAAAFIARQA6ACAAAAAAAAMA3j+fTgAACwACAAEAAAALACMAAAAAAAMA
JgAAAAAACwApAAAAAAALACsAAAAAAAMALgAAAAAAAwA2AAAAAAAfAHAAAQAAAGoAAABbAFAAQQBU
AEMASAAgADIALwAyAF0AIABkAHIAbQAvAGEAbQBkAGcAcAB1AC8AbQBlAHMAMQAxADoAIABlAG4A
YQBiAGwAZQAgAHIAZQBnACAAYQBjAHQAaQB2AGUAIABwAG8AbABsAAAAAAACAXEAAQAAABsAAAAB
AdkEVOdbL6XfbamMQIsGqriLwThirlatOLAACwAGDAAAAAAfADUQAQAAAKIAAAA8AEIATgA5AFAA
UgAxADIATQBCADUAMgA1ADcARABFADEAMwAwADUAMwA5ADcAQgA0ADMAOQBFADUAQQAzADUAQgAw
AEYAQwAxADUAOQBAAEIATgA5AFAAUgAxADIATQBCADUAMgA1ADcALgBuAGEAbQBwAHIAZAAxADIA
LgBwAHIAbwBkAC4AbwB1AHQAbABvAG8AawAuAGMAbwBtAD4AAAAAAB8AORABAAAArAAAADwAMgAw
ADIAMgAxADEAMwAwADAAMAA0ADMANQAzAC4ANQA4ADMAMgAzAC0AMQAtAEoAYQBjAGsALgBYAGkA
YQBvAEAAYQBtAGQALgBjAG8AbQA+ACAAPAAyADAAMgAyADEAMQAzADAAMAAwADQAMwA1ADMALgA1
ADgAMwAyADMALQAyAC0ASgBhAGMAawAuAFgAaQBhAG8AQABhAG0AZAAuAGMAbwBtAD4AAAAfAEIQ
AQAAAFYAAAA8ADIAMAAyADIAMQAxADMAMAAwADAANAAzADUAMwAuADUAOAAzADIAMwAtADIALQBK
AGEAYwBrAC4AWABpAGEAbwBAAGEAbQBkAC4AYwBvAG0APgAAAAAAAwCAEP////8DABMSAAAAAEAA
BzBpOiT8WgTZAQIBEDABAAAARgAAAAAAAADWKlqz4tK9Tpd9zMWGkv/XBwAl1VtYLcSKSJEbvkL8
fuG9AAAAx5zUAAB71EnPj4WuRrj3nM5foTXsAAPgKLlPAAAAAAIBEzABAAAAEAAAAFsvpd9tqYxA
iwaquIvBOGICARQwAQAAAAwAAABUAAAAXKGD+1IAAAADAFszAQAAAAMAWjYAAAAAAwBoNg0AAAAL
APo2AQAAAB8A2T8BAAAA/gEAAFIAZQB2AGkAZQB3AGUAZAAtAGIAeQA6ACAASABhAHcAawBpAG4A
ZwAgAFoAaABhAG4AZwAgADwASABhAHcAawBpAG4AZwAuAFoAaABhAG4AZwBAAGEAbQBkAC4AYwBv
AG0APgANAAoADQAKAFIAZQBnAGEAcgBkAHMALAANAAoASABhAHcAawBpAG4AZwANAAoALQAtAC0A
LQAtAE8AcgBpAGcAaQBuAGEAbAAgAE0AZQBzAHMAYQBnAGUALQAtAC0ALQAtAA0ACgBGAHIAbwBt
ADoAIABhAG0AZAAtAGcAZgB4ACAAPABhAG0AZAAtAGcAZgB4AC0AYgBvAHUAbgBjAGUAcwBAAGwA
aQBzAHQAcwAuAGYAcgBlAGUAZABlAHMAawB0AG8AcAAuAG8AcgBnAD4AIABPAG4AIABCAGUAaABh
AGwAZgAgAE8AZgAgAEoAYQBjAGsAIABYAGkAYQBvAA0ACgBTAGUAbgB0ADoAIABXAGUAZABuAGUA
cwBkAGEAeQAsACAATgBvAHYAZQBtAGIAZQByACAAMwAwACwAIAAyADAAMgAyACAAMAA4ADoANAA0
AA0ACgBUAG8AOgAgAGEAbQBkAC0AZwBmAHgAQABsAGkAcwB0AHMALgBmAHIAZQBlAGQAZQBzAGsA
dABvAHAALgBvAHIAZwAAAAAAHwD4PwEAAAAeAAAAWgBoAGEAbgBnACwAIABIAGEAdwBrAGkAbgBn
AAAAAAAfAPo/AQAAAB4AAABaAGgAYQBuAGcALAAgAEgAYQB3AGsAaQBuAGcAAAAAAB8AIkABAAAA
BgAAAEUAWAAAAAAAHwAjQAEAAAACAQAALwBPAD0ARQBYAEMASABBAE4ARwBFAEwAQQBCAFMALwBP
AFUAPQBFAFgAQwBIAEEATgBHAEUAIABBAEQATQBJAE4ASQBTAFQAUgBBAFQASQBWAEUAIABHAFIA
TwBVAFAAIAAoAEYAWQBEAEkAQgBPAEgARgAyADMAUwBQAEQATABUACkALwBDAE4APQBSAEUAQwBJ
AFAASQBFAE4AVABTAC8AQwBOAD0ANwAzAEYAOQAyADEANgA3ADcAQQBCADkANAA3ADkANgBCADkA
MQAzAEQANQAxADgANQAzADkAQgAwADMAOAA4AC0AWgBIAEEATgBHACwAIABIAEEAVwBLAAAAAAAf
ACRAAQAAAAYAAABFAFgAAAAAAB8AJUABAAAAAgEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBMAEEA
QgBTAC8ATwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBF
ACAARwBSAE8AVQBQACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBOAD0A
UgBFAEMASQBQAEkARQBOAFQAUwAvAEMATgA9ADcAMwBGADkAMgAxADYANwA3AEEAQgA5ADQANwA5
ADYAQgA5ADEAMwBEADUAMQA4ADUAMwA5AEIAMAAzADgAOAAtAFoASABBAE4ARwAsACAASABBAFcA
SwAAAAAAHwAwQAEAAAAeAAAAWgBoAGEAbgBnACwAIABIAGEAdwBrAGkAbgBnAAAAAAAfADFAAQAA
AB4AAABaAGgAYQBuAGcALAAgAEgAYQB3AGsAaQBuAGcAAAAAAB8AOEABAAAAHgAAAFoAaABhAG4A
ZwAsACAASABhAHcAawBpAG4AZwAAAAAAHwA5QAEAAAAeAAAAWgBoAGEAbgBnACwAIABIAGEAdwBr
AGkAbgBnAAAAAAADAFlAAAAAAAMAWkAAAAAAAwA3UAEAAAADAAlZAQAAAB8ACl0BAAAALAAAAEgA
YQB3AGsAaQBuAGcALgBaAGgAYQBuAGcAQABhAG0AZAAuAGMAbwBtAAAAHwALXQEAAAAsAAAASABh
AHcAawBpAG4AZwAuAFoAaABhAG4AZwBAAGEAbQBkAC4AYwBvAG0AAAACARVdAQAAABIAAAACH5bY
PYjkYE6OEagtmU4YPQEAAAIBFl0BAAAAEgAAAAIfltg9iORgTo4RqC2ZThg9AQAACwAAgAggBgAA
AAAAwAAAAAAAAEYAAAAAFIUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAAQhQAAAAAAAAsA
AIAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAAYUA
AAAAAAALAACACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABG
AQAAADIAAABFAHgAYwBoAGEAbgBnAGUAQQBwAHAAbABpAGMAYQB0AGkAbwBuAEYAbABhAGcAcwAA
AAAAIAAAAB8AAIATj/JB9IMUQaWE7ttaawv/AQAAABYAAABDAGwAaQBlAG4AdABJAG4AZgBvAAAA
AAABAAAAKgAAAEMAbABpAGUAbgB0AD0ATQBTAEUAeABjAGgAYQBuAGcAZQBSAFAAQwAAAAAAAgEA
gBOP8kH0gxRBpYTu21prC/8BAAAALgAAAEgAZQBhAGQAZQByAEIAbwBkAHkARgByAGEAZwBtAGUA
bgB0AEwAaQBzAHQAAAAAAAEAAAA2AAAAAQAKAAAABAAAAAEAAAAUAAAAAAAAAAAAAABJAAAAAAAA
ABQAAAAAAAAAYwEAAP////8AAAAAAAAfAACAH6TrM6h6LkK+e3nhqY5UswEAAAA4AAAAQwBvAG4A
dgBlAHIAcwBhAHQAaQBvAG4ASQBuAGQAZQB4AFQAcgBhAGMAawBpAG4AZwBFAHgAAAABAAAA6AEA
AEkASQA9AFsAQwBJAEQAPQBkAGYAYQA1ADIAZgA1AGIALQBhADkANgBkAC0ANAAwADgAYwAtADgA
YgAwADYALQBhAGEAYgA4ADgAYgBjADEAMwA4ADYAMgA7AEkARABYAEgARQBBAEQAPQAwADEARAA5
ADAANAA1ADQARQA3ADsASQBEAFgAQwBPAFUATgBUAD0AMgBdADsAUwBCAE0ASQBEAD0ANQA5ADsA
UwAxAD0APAAyADAAMgAyADEAMQAzADAAMAAwADQAMwA1ADMALgA1ADgAMwAyADMALQAyAC0ASgBh
AGMAawAuAFgAaQBhAG8AQABhAG0AZAAuAGMAbwBtAD4AOwBSAFQAUAA9AEQAaQByAGUAYwB0AEMA
aABpAGwAZAA7AFQARABOAD0AUgBlAG0AbwB2AGUAZAA7AFQARgBSAD0AUABhAHIAdABpAGMAaQBw
AGEAbgB0AEMAaABhAG4AZwBlAGQAOwBWAGUAcgBzAGkAbwBuAD0AVgBlAHIAcwBpAG8AbgAgADEA
NQAuADIAMAAgACgAQgB1AGkAbABkACAANQA4ADUANwAuADAAKQAsACAAUwB0AGEAZwBlAD0ASAAx
ACwAIABUAEMAOwBVAFAAPQA1ADAAOwBEAFAAPQAxAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA
goUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAA
AABGAAAAAA6FAAAAAAAAHwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA2IUAAAEAAAASAAAASQBQAE0A
LgBOAG8AdABlAAAAAAALAACAE4/yQfSDFEGlhO7bWmsL/wEAAAAoAAAASQBzAFEAdQBvAHQAZQBk
AFQAZQB4AHQAQwBoAGEAbgBnAGUAZAAAAAAAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAABAAAAA
QwBvAG4AdgBlAHIAcwBhAHQAaQBvAG4AVAByAGUAZQBQAGEAcgBlAG4AdABSAGUAYwBvAHIAZABL
AGUAeQAAAAEAAAAuAAAAAAAAANYqWrPi0r1Ol33MxYaS/9cBAHvUSc+Pha5GuPeczl+hNewABhJi
usoAAAAACwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJgAAAEkAcwBQAGUAcgBtAGEAbgBlAG4AdABG
AGEAaQBsAHUAcgBlAAAAAAAAAAAAAwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJAAAAEkAbgBkAGUA
eABpAG4AZwBFAHIAcgBvAHIAQwBvAGQAZQAAABsAAAAfAACAUONjC8yc0BG82wCAX8zOBAEAAAAq
AAAASQBuAGQAZQB4AGkAbgBnAEUAcgByAG8AcgBNAGUAcwBzAGEAZwBlAAAAAAABAAAAcAAAAEkA
bgBkAGUAeABpAG4AZwAgAFAAZQBuAGQAaQBuAGcAIAB3AGgAaQBsAGUAIABCAGkAZwBGAHUAbgBu
AGUAbABQAE8ASQBJAHMAVQBwAFQAbwBEAGEAdABlACAAaQBzACAAZgBhAGwAcwBlAC4AAAALAACA
E4/yQfSDFEGlhO7bWmsL/wEAAAAcAAAASABhAHMAUQB1AG8AdABlAGQAVABlAHgAdAAAAAEAAAAC
AQCACCAGAAAAAADAAAAAAAAARgEAAAA2AAAASQBuAFQAcgBhAG4AcwBpAHQATQBlAHMAcwBhAGcA
ZQBDAG8AcgByAGUAbABhAHQAbwByAAAAAAABAAAAEAAAAMGQeotx2JxIl9/RV1Ldqz0fAACAhgMC
AAAAAADAAAAAAAAARgEAAAAYAAAAbQBzAGkAcABfAGwAYQBiAGUAbABzAAAAAQAAAAAEAABNAFMA
SQBQAF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4
ADQAYgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBBAGMAdABpAG8AbgBJAGQAPQA4AGUA
NgBjAGIANQBhAGYALQAxAGQANAA5AC0ANABhADYANgAtAGEAZAA2AGQALQAwAGYAYwBiADEAYQA3
ADMANQA3AGMANAA7AE0AUwBJAFAAXwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQA
ZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAEMAbwBu
AHQAZQBuAHQAQgBpAHQAcwA9ADAAOwBNAFMASQBQAF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEA
NABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4ADQAYgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAw
AGYAXwBFAG4AYQBiAGwAZQBkAD0AdAByAHUAZQA7AE0AUwBJAFAAXwBMAGEAYgBlAGwAXwA0ADMA
NAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAx
ADcAMABhADAAZgBfAE0AZQB0AGgAbwBkAD0AUwB0AGEAbgBkAGEAcgBkADsATQBTAEkAUABfAEwA
YQBiAGUAbABfADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQALQA0AGIANQA4AC0AOAA0AGIAZgAt
ADMAOABiAGUAZAA2ADEANwAwAGEAMABmAF8ATgBhAG0AZQA9AEcAZQBuAGUAcgBhAGwAOwBNAFMA
SQBQAF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4
ADQAYgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBTAGUAdABEAGEAdABlAD0AMgAwADIA
MgAtADEAMQAtADMAMABUADAAMQA6ADIANwA6ADQAMQBaADsATQBTAEkAUABfAEwAYQBiAGUAbABf
ADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQALQA0AGIANQA4AC0AOAA0AGIAZgAtADMAOABiAGUA
ZAA2ADEANwAwAGEAMABmAF8AUwBpAHQAZQBJAGQAPQAzAGQAZAA4ADkANgAxAGYALQBlADQAOAA4
AC0ANABlADYAMAAtADgAZQAxADEALQBhADgAMgBkADkAOQA0AGUAMQA4ADMAZAA7AAAASAAAgGvF
P0AwzcVHhvjt6eNaAisBAAAAHAAAAE0AUwBJAFAATABhAGIAZQBsAEcAdQBpAGQAAABOMUJD9A1Y
S4S/OL7WFwoPAwANNP0/AAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAYQB1AHQAaABlAG4A
dABpAGMAYQB0AGkAbwBuAC0AcgBlAHMAdQBsAHQAcwAAAAAAAQAAALIAAABkAGsAaQBtAD0AbgBv
AG4AZQAgACgAbQBlAHMAcwBhAGcAZQAgAG4AbwB0ACAAcwBpAGcAbgBlAGQAKQAgAGgAZQBhAGQA
ZQByAC4AZAA9AG4AbwBuAGUAOwBkAG0AYQByAGMAPQBuAG8AbgBlACAAYQBjAHQAaQBvAG4APQBu
AG8AbgBlACAAaABlAGEAZABlAHIALgBmAHIAbwBtAD0AYQBtAGQALgBjAG8AbQA7AAAAAAAfAACA
hgMCAAAAAADAAAAAAAAARgEAAAAeAAAAYQBjAGMAZQBwAHQAbABhAG4AZwB1AGEAZwBlAAAAAAAB
AAAADAAAAGUAbgAtAFUAUwAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACAAAAB4AC0AbQBzAC0A
aABhAHMALQBhAHQAdABhAGMAaAAAAAEAAAACAAAAAAAAAB8AAIBrxT9AMM3FR4b47enjWgIrAQAA
ABIAAABNAEkAUABMAGEAYgBlAGwAAAAAAAEAAADMAQAAWwB7ACIAaQBkACIAOgAiADQAMwA0ADIA
MwAxADQAZQAtADAAZABmADQALQA0AGIANQA4AC0AOAA0AGIAZgAtADMAOABiAGUAZAA2ADEANwAw
AGEAMABmACIALAAiAHQAaQAiADoAIgAzAGQAZAA4ADkANgAxAGYALQBlADQAOAA4AC0ANABlADYA
MAAtADgAZQAxADEALQBhADgAMgBkADkAOQA0AGUAMQA4ADMAZAAiACwAIgBwAGkAIgA6ACIAMAAw
ADAAMAAwADAAMAAwAC0AMAAwADAAMAAtADAAMAAwADAALQAwADAAMAAwAC0AMAAwADAAMAAwADAA
MAAwADAAMAAwADAAIgAsACIAbgBtACIAOgAiAEcAZQBuAGUAcgBhAGwAIgAsACIAYQBjACIAOgAw
ACwAIgBvAHAAIgA6ADEALAAiAGMAdAAiADoAIgAyADAAMgAyAC0AMQAxAC0AMwAwAFQAMAAxADoA
MgA3ADoANAAxAFoAIgAsACIAbQB0ACIAOgAiADAAMAAwADEALQAwADEALQAwADEAVAAwADAAOgAw
ADAAOgAwADAAIgAsACIAdQBjACIAOgBuAHUAbABsAH0AXQAAAEgAAIAIIAYAAAAAAMAAAAAAAABG
AQAAACIAAABOAGUAdAB3AG8AcgBrAE0AZQBzAHMAYQBnAGUASQBkAAAAAADQFjyjUAPyQ4a0CNrS
ch8eHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAALgAAAHgALQBtAHMALQBwAHUAYgBsAGkAYwB0AHIA
YQBmAGYAaQBjAHQAeQBwAGUAAAAAAAEAAAAMAAAARQBtAGEAaQBsAAAAHwAAgIYDAgAAAAAAwAAA
AAAAAEYBAAAANgAAAHgALQBtAHMALQB0AHIAYQBmAGYAaQBjAHQAeQBwAGUAZABpAGEAZwBuAG8A
cwB0AGkAYwAAAAAAAQAAAEgAAABCAE4AOQBQAFIAMQAyAE0AQgA1ADIANQA3ADoARQBFAF8AfABN
AFcAMwBQAFIAMQAyAE0AQgA0ADUAMAA4ADoARQBFAF8AAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AABQAAAAeAAtAG0AcwAtAG8AZgBmAGkAYwBlADMANgA1AC0AZgBpAGwAdABlAHIAaQBuAGcALQBj
AG8AcgByAGUAbABhAHQAaQBvAG4ALQBpAGQAAAABAAAASgAAAGEAMwAzAGMAMQA2AGQAMAAtADAA
MwA1ADAALQA0ADMAZgAyAC0AOAA2AGIANAAtADAAOABkAGEAZAAyADcAMgAxAGYAMQBlAAAAAAAf
AACAhgMCAAAAAADAAAAAAAAARgEAAAA4AAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAHMA
ZQBuAGQAZQByAGEAZABjAGgAZQBjAGsAAAABAAAABAAAADEAAAAfAACAhgMCAAAAAADAAAAAAAAA
RgEAAAA6AAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAHIA
ZQBsAGEAeQAAAAAAAQAAAAQAAAAwAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAKgAAAHgALQBt
AGkAYwByAG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAAAAAAAQAAAA4AAABCAEMATAA6ADAA
OwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAARAAAAHgALQBtAGkAYwByAG8AcwBvAGYAdAAt
AGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUALQBpAG4AZgBvAAAAAQAAALIFAABQAHoA
cAArAFUAeABTAEcAMABGAEwAcwA0ADYAUQBWAFcAVwB3AHEAUwBTAFIAbQAzAEcATwBZADcAVgBR
AGwAWAByAG4AZwBGAGYAagB3AGQAdQBDAE0AbABBAFQAKwBpADIAdwBEADgATQB4AGUAZwBiADAA
SwBzAEgASwBrAE8AaABQAGIATgBxAGoAeQB3AGYAOAAyADAAOABwAHAATgBSAEwAWQBQAFUAVAA2
AHMAdgBzAGMAcAAwADYAegByAG0ANgBUAHoAagBuAGYAVQBOAHoARwA3ADAAeABwAEIAUwBtAFUA
SAA1AHEAdwBjAHAANQA1ADAATABjADIAeAAzADYAMwBFAE8ANgBZAGQAbwBMAGsATgBMAEoAOQAy
ADEAeQBDADcAZgA0AFMAbgBQAHEAMwBFAGIAUwBrAHUAMgB2AFkAMQBZAFQAdwArAEwATAAxADMA
WQBHAEcAWAAzADQAMQBoAFAAOABMAHcAUABaADgAQQBDAHAAMABDAFcATgAyAGEAbwBMAG0AKwB6
AEwAWABPADEALwBPAHIATABmAE0ANgBQAFkASgBGAEoANwBOAEQAbwBlAEkAUAA2AGUAQwBRAEMA
NwBIAEoAZABTAFgAbQBUADUANAAwAG0AbABtAGMAeQA5ADAAaAAxADQAeAA5AFIAcABmAFYAcABz
AE8AOABmAHgAOABmAG8AdQBZAGgAUQBvAFQAUABSAEEAUAA2ADcAUwA4AHIASgBEAE0AbwBxADkA
dAAwAHMAZwBtAC8ARgB4ADEAcgBBADAAZABRAHIAQwA0ADQAcABGAEUAVwAzADcASgB5AHIANwBG
AGoAUQA2AHUARAB5AHcAWABUAFAAdwBqADAAeQByADgAUQB3AHkARgBQAG0AUwBIAFcASQBsAG4A
dABFAFYAOABpAFcAWQBWAFAAdwBVADAAeABtAHkAbQBmAEQARQA4ADMAaQBiADIAbABjAEkATQBO
AEsAVABtAGsAbwBQAGwARgBLADEAQwBFAEMAaQA1ADgALwBXAGoAbgBZAFoARwBHAE4AdQBDADUA
RQBWAC8AMwByAFkAcQB3ADkAagBrAHMARQBWAEcAKwBRAFgAOQB1AG0AMwBpAEEASwAzAGUASgB5
AG0AegArADkASgAxAHoAegBEADcAOABDADMAOABZAEIAeQBqAEUAagBIAFoAYQA2AHgAVQAxAEgA
OQBhADEALwBDADcAYgBWAEcARwBlAEgANgBIAFoAMgBCAFQAVwAyAHYAbwA3ADAAawBHAEEAWgBF
AHEAZABHADIAVwBpAEcAUgBPAEYAdQBrAGEAcABIAHAASwBIAFIARQBWAHcANgAvADcALwAzAHEA
YQBqAGMAbwB1AFUAbABkAGUAQQBhAGEARABpADgANwBxAE0AYQBRAFoAdgBKAFoAKwA0AGsAUgBu
AHcASABzAHgAeQBuAEcAWABUAHAAawBYAEEAMABIADYAcwBPADQAdgAxAHIAMgBHAG4AcgBqAEIA
SAB0AGwATgBYAE0AcgBxAEkAZABjAGUASQB4AHcANAB1AGcAcABQAHUAUwBDAHcAaABYAG4AbABh
AGEALwA4ACsAcAA0AGcARQBQAFEAMgBDAGIAUQBrACsAMwBCAFMANgB6AEkASQAyAEgAZABvAFYA
bwBwAC8ARwByAFUAYQBMAEgALwBXAFoAWQBIAHQAMQA0ADAAbwBRAGYANQBkAGsAcwBGAHIAegBE
AEwANQBhAG4AZwBTAGEARwB5AFkAcgArAHIAaAB4ADQAMQBJAGYAOQBGAGwAUgArAHUAdQBJAGwA
QgBsAFQAUQBJAFQAVgBhAG4ATQA0AGMAcwBxAHoATwBsAFEAMwBoAEUAOABWAEIAOQBsAEYAegA3
AHQARwB6AGIARQBiAFkARABxADQAdwA9AD0AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgA
AAB4AC0AZgBvAHIAZQBmAHIAbwBuAHQALQBhAG4AdABpAHMAcABhAG0ALQByAGUAcABvAHIAdAAA
AAEAAAAkBAAAQwBJAFAAOgAyADUANQAuADIANQA1AC4AMgA1ADUALgAyADUANQA7AEMAVABSAFkA
OgA7AEwAQQBOAEcAOgBlAG4AOwBTAEMATAA6ADEAOwBTAFIAVgA6ADsASQBQAFYAOgBOAEwASQA7
AFMARgBWADoATgBTAFAATQA7AEgAOgBCAE4AOQBQAFIAMQAyAE0AQgA1ADIANQA3AC4AbgBhAG0A
cAByAGQAMQAyAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA7AFAAVABSADoAOwBD
AEEAVAA6AE4ATwBOAEUAOwBTAEYAUwA6ACgAMQAzADIAMwAwADAAMgAyACkAKAA0ADYAMwA2ADAA
MAA5ACkAKAAzADkANgAwADAAMwApACgAMwA5ADgANgAwADQAMAAwADAAMAAyACkAKAAxADMANgAw
ADAAMwApACgAMwA0ADYAMAAwADIAKQAoADMANwA2ADAAMAAyACkAKAAzADYANgAwADAANAApACgA
NAA1ADEAMQA5ADkAMAAxADUAKQAoADQANwA4ADYAMAAwADAAMAAxACkAKAA4ADMAMwA4ADAANAAw
ADAAMAAwADEAKQAoADIAOQAwADYAMAAwADIAKQAoADUAMwA1ADQANgAwADEAMQApACgAMQAxADAA
MQAzADYAMAAwADUAKQAoADcAMQAyADAAMAA0ADAAMAAwADAAMQApACgAMwA4ADEAMAAwADcAMAAw
ADAAMAAyACkAKAA1ADYANgAwADMAMAAwADAAMAAyACkAKAAzADgAMAA3ADAANwAwADAAMAAwADUA
KQAoADEAMgAyADAAMAAwADAAMAAxACkAKAA2ADYAOQA0ADYAMAAwADcAKQAoADQAMQAzADAAMAA3
ADAAMAAwADAAMQApACgAOAA5ADMANgAwADAAMgApACgANQAyADUAMwA2ADAAMQA0ACkAKAA2ADUA
MAA2ADAAMAA3ACkAKAA3ADYAOQA2ADAAMAA1ACkAKAA2ADYANQA1ADYAMAAwADgAKQAoADYANgA0
ADcANgAwADAANwApACgANAAzADIANgAwADAAOAApACgAOAA2ADMANgAyADAAMAAxACkAKAA4ADYA
NwA2ADAAMAAyACkAKAA2ADQANwA1ADYAMAAwADgAKQAoADYANgA0ADQANgAwADAAOAApACgAOQA2
ADgANgAwADAAMwApACgAMgA2ADAAMAA1ACkAKAAzADEANgAwADAAMgApACgAMwAzADYANQA2ADAA
MAAyACkAKAAxADgANgAwADAAMwApACgANQA1ADAAMQA2ADAAMAAzACkAKAA3ADYAMQAxADYAMAAw
ADYAKQA7AEQASQBSADoATwBVAFQAOwBTAEYAUAA6ADEAMQAwADEAOwAAAB8AAICGAwIAAAAAAMAA
AAAAAABGAQAAAFwAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBt
AC0AbQBlAHMAcwBhAGcAZQBkAGEAdABhAC0AYwBoAHUAbgBrAGMAbwB1AG4AdAAAAAEAAAAEAAAA
MQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEoAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBl
AC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBkAGEAdABhAC0AMAAAAAAAAQAAAIIM
AABQAFEAaABTAGgASgBYAFQAYgBLAEoARQBpAGIAMAArAGMAYwB6AE4ANQAvAEMAaAA0AFUAQwB1
AEEAMABsAFMAdABqADAAQQBnADUALwBjAFUATAA3AGQAUgB5AEIAZAAzAEsASwB3AHQAdgBYAHEA
TgBQAEQAVwB0AHkAMgBqAFQAUQBmAEwAUwBnAFcARQB0AHkASABhAFIAcABrAHQAdgArAEMAegBL
AG8AVgBJAG8AbQBRADIAawBwAGUAZwBYAGMAMAA5ADkAMQBrAFoAcwAwADUAbgBKACsAMgBLAGMA
RgB4AE4ANgBBAGEAdwBCAG0ARwBZAGQASgB6AEwATQBpADYAaQBMAFQAeQBQAHUAWABGAEIAWgBT
AGsAZwBvADEATwB1AGoAbwBwAGwAZQA3AGkAQgA2AFYAdQBtADAARAAwAEQAZgBnAHkAVABwAHUA
NABZAEIAaQBJAHEANQBnAEgANABIAFkAUABRADEAQgB3AGgAWAA5AEoAaQBGAGgARgB3AEYALwBB
AEkAUABrAFIAdQB3AEkAMwBUADIALwBUADAARgA1AHkAMwByAHoANQAzAHQAVwBLAEYAdgBlAFUA
TgA3AEcAYgBxAGQATwB6AGcAVwB2AEsAbwBpAGIATABFAHQAcwArAFMAegBTAG8AVgBMAHkAMQBD
AGQAOQBoAG8ATgBpAFMAcABSAG4AQQBQADkARgBDADIALwA4AGkAbQB4ADYAZgBIADEAWgBRAFoA
dgB6AFgAbABxAHoAWQBKAEMATAAvAFAATwBHAEoAYwBoAEIAagAxAHgAcgB3AEcAQQB5AHoAZABI
AHQAMQB5ADcAdQBnAE0ANABKAHoAKwBNAHkAMABMAFUAYwBZAGMARwBwADkAbgA5AGQAdAByAG0A
bgByADgARAA1AHkAdwBOAHUASQBXADYAWQBrAFEAdQB1AC8AdwBFAEwASQA2AFIAbgBqAGEAdgA3
AHkAcwBIAHQARwBtAHUAUABDAEoAdQBNAHgAVgA3AFUAVwBUAEYARwB4ADQASQBmAEUAMABsAGMA
VgB0AHkANQBqAHQAKwBlACsAdgBEAEwASgAxAHMAWgBFAGoAagAwAGsATQBZADMAaQBpADIATwA1
AGUAMABpAGIAWgA3AHcAOQA4AC8AdgBRAGUAOQBkADAAcQB5ADkAQwBNADQASgBBAE4AWQBzAFEA
TwBNADIAdABpAEoAbgBQAGMAawBvAGEAQQBxAGkAMgA1AE0AbgBkAFkANwBhAGsAZwA4ADMANQBV
AE8AMgA1AFAARAAvAC8AQgBmAFMAaQBEAHIAZwBJAFQAUgBzAGUAYgBwAGQAcgA2AFUAUABNAHIA
dABwAHgAQQA1AFYATABjAE0AcAB2AHUATQBRAGIAegBLAEYAVwBOADAASwA5AFUAZQBSADcAYgBo
ADQAbgBiAFcAagBxAFgASgBPAHkAQQBXADQAKwBlAGEASwBpAHcARwA5AE0AbQBHAG0AegBIAFQA
awBpAFAAQgBZADMAWgBRACsAbgBFAGcASgA4ADgASgBOAGoAdABjAFQAQQBsAE4ARAB4ACsAZABK
ADUAcgBxADMAVwA0AGIAYgB5AG4AUQA2AGMAcwBSAG4AdABoAFUARwAzADYAagBmAEkAbgB5AE4A
agBkAFIAMABVAEYAYgB4AHgAMABFAGQAMQBUAFcAagA0ADcARgAvAFUATABrAHAAbQBZAE8AcQA5
AEQAagAwADAARAAwAFYANQBmAGsAdQBnACsANQByAEUATABMAFEAQQBUAFgAeQBrADEASwA3AEIA
TwBpAHEAWQBjAEQAdwBCAFQAVQBJADIARAAyAEgATQBVAFoAYgB5AG0AagBMAE0AdwBEAHcARwAv
AFYAcgBOAFQAQQBNAE4AWQBjAHoAMwAvAFQAOABJAFQAbwB0AGcAMgBIAGQAMwAwAFIATwBFAGsA
SwBRAFMANwArADQAdgB6AGoASwBUAGUAdwBPAG8AVwA0AGcARQBXAEYAWABJAHgAbwBXAHoAWgBq
AEMAOABzAEYAMgBYADkAWgBxAFYAUAByAFAAUABXADIANQB6ADkAdABPAGYAVABTADQAdwBjAFcA
aABXAHcAZwBEAGcASgAyAFMAOABvAG4AbwBJAHEAegBiAHkAegBWAEwAbwBRAEQAQQAyAC8AWgBm
AFkARABXADMANAAwADYAZwB6AHcAdwBJADkAUgBzAHoAbgBRAEIAOAAwAHcAVwBZADYAVQBhAHEA
bwBSAG0AZgBkAGEARgB5AHYAQwBMACsANwBkAHoAYQBTADIAcwBmAEIASwByAGEASgBpAFkANQA2
ACsAaQBKADMAVQB0AHkASAAyAG0AcQBQAFgAYQBuAFoAMgB1AHUAUQBZAHQAcwBNAHAAZQBwAGQA
agBzAEoAWAA2AHoAdAByAGkAeQArAGwAUgBEADAANABZAGsAbQBhAEgARABFAG8AYQByAE8AaAA4
AFAATABlAGIAWgBXAGQARgBoAGoAcQBMAGgAWgBmAGYAdgA0AEoAcgBPAFgAUgByAGYAUQBCAHIA
TwBNAFUARwB0AGEASABFAEkANABVAEgAUgBZAEwAbwBHAHkAaABDAFQAbABpAHkANgBFAFMAUwA3
AFMAeQBWAE0AWABhAHMAWAB4AC8AOQBtAFgANgBLAHcAdQBSAGEAZAB5AGEAcQBXAE0ANAAyADQA
QgBOAEgAbQBUAHcAaABuADcAYwBuAEUAUgBUAEIAdwA3AHkAbgBQAHcAOQBkAEUAOABwADcATQBH
AHYAYwBsAHEAeABUAEwARwB2AHUAWQBiAHMAdQBaAHoARQB1AFQATAByAEwAMQA2AEMAawBXAHYA
LwBkAHcAZQBaAEgALwByAGYASgB5ADEATABqADgASQBLAEkATwBTADUAdgB0AGUAcwBaAFgAbQBQ
AEUAeQAyACsATAB1ADUAOQBYADAARwBFAGoAMwBUADEAMwB0AGQAVwA0AGsAZQBzAEoAcwA3AFIA
NABnAE0AUgBVAFgAbABqAFEAUwBjAEEAcQBWADYAYgA1ADIAWABoAHMARwBaAHMAVABzAGwASQB6
AFIAeABwAHIAeABzAC8ASAA5AE0AUQBGAHMAWAAwADMAYgBKAHcANwA2AE4ASgB3ADUAdAA3AGYA
SQA0AGsARgByAGMAUQBrAEYAbwBuAGsAYgBMAEQAVABMAGQAVwBBADAAZgBoADMAbwBHAEQAdwBt
AGcALwBTADcAZwBFAGcARAArAGoAVQBEADUAdABSAHEASwBDAFMAYQBJADUAQwB3AGEAUQBNAGUA
SgB3AEcARwBJADQAdgBUAHgAdwBjAGYAVQArAGIAdgBkAHEAVgBVAGgAcABJAFoAdgBWADUAYwA3
AFIAUQByAEYARQBJAFcAWABuADcAbwBVAFgAVQBKADMAdgBWAEUAdQBzADEAVQBIAEYAaQArAHoA
dgBoAHAAVwBzADIAUQBmAEcAdgBPADEAQgAvAGsAeABoADUARwBWAC8AQgBVADEAMABLAFIAagBP
AFkAUABoAGgAMQBUAG4AdgB5AG4AYwBJAGMAMgBJADgALwBHAGsAUwBzAE8ANgA0AG0AdABLAEsA
aAB4ACsAWQBvAG8AZQBnAE0ASgBkAGIAZQBGAFEAeQBrAE0AVwBBADEAKwBRAGIAdgBIAHoANgB1
AHIAQgBRAHYANQBFACsATQBNAE8ATwB0AHIAcwBKAFEAbgBFAE4AOQAxAEEAVABZAFoAcABZAFIA
RwBqADIAeQBRAGkAZQBhAEcAaQBxAE4AdwAvAHIAOABDAGsATwBsAHoAZwB1AHgAdABlAHgATgB4
AG0ALwBkAHUAOQBJAFkAUgBkADgAcgAxAFAAMgBhADgANwBaAHQARgBMAGoAcwBOADgANQBsAGYA
MgB4AFYAcgA0AGgAOAA4AG8AOQBFAFoATwAzAGUARwBzAHYASQA1AGwAOQBWADgAdABpAFAAeQBD
AEsANABZAHEAcgBxAHIAMwB4AHQAagBVADUAeABYAEYAeQBmAFgAOQB6AEkATgBMAGMANwBDAE4A
ZwBBAG0ANwA0ADQATgBrADcANQBaAE8AaQAyAHUAMQBiADAAWgAxAGwANABIAE4AKwBQAE0AbQAz
AFcAQQA5AGIAbQBVAHkARAA3AEsAcQBzAEYAKwBJAEsASABwAEYATABKADIATAAxAEoAcABTAHUA
WQB0AEMAeAB1AAAAAADdGA==

--_000_BN9PR12MB5257DE1305397B439E5A35B0FC159BN9PR12MB5257namp_--
