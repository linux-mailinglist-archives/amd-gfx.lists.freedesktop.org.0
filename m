Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B063357A
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Nov 2022 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304E410E07C;
	Tue, 22 Nov 2022 06:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41CD10E38F
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Nov 2022 06:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R90u9/7nkdlA0fla8Q8PVGXYMKxAc0TpWyFrIqAMzgEgNmZEzNkkcZxqfh6QwVUJJTEKlFu+G1FOuq70U792rj+nfX4Ja0Ug5nTWJMPtI6/tZ+hyabSEm5I20lG4kPz8BPbpJ/af1kphmTEwFa+rQUx5+xB5mDUQXg3ZPdPkCSJm5ApbbimXrCEMl80sJqc2Yu8FwJDbqFfQJgwg1BHxEaixU7jMdmQf9KjJ3+4jfjmcOy7DXspOTgccYgGoMnd3nQwr0eb7azCYfRHoRUZhh9oFU67qS3ZoWaMx0DL7vxpv24lQoWCrS97MbTCtH5l08zU1GeOosL9OoaU2nBGv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV6XLE0Gg30Bbjj+HoWN+9gnGnGK6PqhsjpjTigQe2U=;
 b=a3GTCdTuuvi6eCPctEJfcvmA5xeKlSZB8wVH0hfmjy19eov6VJUZdvFdK8IUdq2PR92PXpqHr4+W7wmWRGX+GE7R9kCGruy8rKHPo3JPFy8ZCY36TxT6Hep+PXdb1KrlkQmVnO1d5fHAm4HbSYA3MS8wkoSQu6zAzTiGRdA3hyonHh4GWrLK6d+sfxCwCzH7uj8Er4BNRrtTpHywS6NFI0JYyAwASth6GpzE/IK8S3iEagSTHAy2vS80RWVXkd3rM45DCC78u+IRO7NHApxRRFECBzJJCJyaOfxVFgpDaf3ex6PIRvCfHpddleG5RjZWccdi2aTcIot0idBPQEmRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV6XLE0Gg30Bbjj+HoWN+9gnGnGK6PqhsjpjTigQe2U=;
 b=hNJYehW1mbHTmtTM+9V3tjwD/Yl8RzAGIzNJ9e5esZWScV7SmCE+LV7Bi9Snb41mQEYhS++UfoeIxJ2T7hBsOsVhjXpph7ryjMrcthy/lwf59hSz8S+ksP3zLZLn+UNz9pFfBTjdzb6+i3JnsAwvwXeSkNIBqRBd9hrlFzwN9FQ=
Received: from DM5PR12MB1770.namprd12.prod.outlook.com (2603:10b6:3:108::22)
 by CY8PR12MB7730.namprd12.prod.outlook.com (2603:10b6:930:85::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Tue, 22 Nov
 2022 06:49:09 +0000
Received: from DM5PR12MB1770.namprd12.prod.outlook.com
 ([fe80::10ba:448f:9342:8ae5]) by DM5PR12MB1770.namprd12.prod.outlook.com
 ([fe80::10ba:448f:9342:8ae5%10]) with mapi id 15.20.5834.015; Tue, 22 Nov
 2022 06:49:08 +0000
Content-Type: multipart/mixed;
 boundary="_000_DM5PR12MB17706C1E60B13D31E304B9C5B00D9DM5PR12MB1770namp_"
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: enable RAS poison for VCN 2.6
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable RAS poison for VCN 2.6
Thread-Index: AQHY7mRDJuudvo6UOkOaBfTWS35Gb65KoCXQ
Date: Tue, 22 Nov 2022 06:49:08 +0000
Message-ID: <DM5PR12MB17706C1E60B13D31E304B9C5B00D9@DM5PR12MB1770.namprd12.prod.outlook.com>
References: <20221102023608.17242-1-tao.zhou1@amd.com>
 <20221102023608.17242-2-tao.zhou1@amd.com>
In-Reply-To: <20221102023608.17242-2-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <DM5PR12MB17706C1E60B13D31E304B9C5B00D9@DM5PR12MB1770.namprd12.prod.outlook.com>
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-11-22T06:49:05Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c80d70f1-288c-4783-845a-11f0f8fbb81a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-11-22T06:49:05Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 4cc5989e-acfa-4adb-9337-668262e35c57
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB1770:EE_|CY8PR12MB7730:EE_
x-ms-office365-filtering-correlation-id: 825daeb2-1edd-42ed-f9a3-08dacc55a7e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZBAEDArNoojdlgiCu81RvfI1yzt9tJkfbtG7nN9fxWi522YSG4v6WSKsPGwOM9Ca68aXKYg9hpSRvYMJUY9jMulbBHknMW3ri8Eb7gblZj8o7ikxpnUFZyzVGiC7TMXpeMVxDL1DSo5esJ2dT6WGo9hfAmz7vMs9uMt1Y/ZWoYEuh1pHV0xPJBtVvdHOBMT0Tq0kT08NtcFZznOexCM1WYOxuCflTgl1umOdp/GsWV7+RLoLJj9MUv76wZk/g10eUd+Jqu4aoFd4+DmPoME+oPNgr6pc0J2BtxtabWhhA5Lp8sz66aTf6CN/f9HmnF7PRd+Ezi0jXB8uTBzD6gIBDMkfySFgIY+QldNmQlqEgyLlisEinnrhPSgyfk+j2lJRQrtMt8S612+ly/fjKonacbvCgra3wbcAK8/hERN0qZRz7IW7g3Uy2V/Vaouyygz+Bk+r2rgac7lloap4PwRtUbxNO/zogPACrUdfIwWm0Y6J42TB/MYWU9gCcZxFGAy450MOPrybDRS9+z7JR1PxcGd+dzLVc+WP9+rJDAJX08p2FsG5aHcVsrG98gR3p4a0r6sF4dyo0SwplDCWmOZU0cROUGdRx6KC0cvzrbzDWPDZi8TqpQ+CGml5FYiKI8JrCaqyIEXZWrRB6rY9hPxru1wfQAgi04ASiP+GdTxh4o0d1q8s83nkpJnBt14l8Lrpd3wERZ7E8Ow5y9gzj75kag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(26005)(38070700005)(2906002)(86362001)(9686003)(83380400001)(38100700002)(66476007)(8676002)(122000001)(33656002)(4326008)(66446008)(66556008)(55016003)(71200400001)(64756008)(76116006)(41300700001)(66946007)(6636002)(52536014)(110136005)(53546011)(8936002)(5660300002)(316002)(186003)(7696005)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pzcyItjlW8N6PGFhXEEuAOaRvnVqaqLKIXgmlRctoODbp35/5LvaF0JAg0Xv?=
 =?us-ascii?Q?8t8j0ghg+DYBenFoqfjmAZPKcoh9VEHCacskGyDNjddXYEa7M+Qwzxs438p6?=
 =?us-ascii?Q?Ml3wIE1OXqMP+yGPZLLUiwS8XQUVieVlkDV0r2nqXC3ZDDQB4n9pf/ehQCEq?=
 =?us-ascii?Q?NAv6Gn8e9AhX4G1cVwA2Pk5jyb8VXBByQSEpri/uGt9bryIorK1H1ANfd2tM?=
 =?us-ascii?Q?4dlmIAXcd7+9RMWzL89/VfV4LxhfI7rRyJoD63YFvXjFS5sB24+Ul+Vs3yQW?=
 =?us-ascii?Q?HlS+X57+ewSD/WlhZTKpw3KnAMt/XJw0zptVOok0CTwDvCQdtFZ867eO0NPb?=
 =?us-ascii?Q?a7T42caDkkR8fbuTxvGO3qPetJWOqgYP8QSr0/wP/QoyWePHhGeMxR/CJ/Ms?=
 =?us-ascii?Q?ERtqkHEqLONzagPyWSvzACKZVetsBXogjQDZ0OIrtkpq8mykgng7+i2spPLR?=
 =?us-ascii?Q?RETxpn64i67ixFkKJdQq9YenTTiQtfcDPbiWSbegq1QRH0dZHJDtxAoO2Z3d?=
 =?us-ascii?Q?JPZ2VvXNetKaqR1Zd3Bb5KN7ahwy1XCOGxW/CA2k8sQwhIbHdh21Ee0v9fac?=
 =?us-ascii?Q?mvzZo63eoChm1bBC9/DZ8HLTy4Ot/pSWfnknfldlrsnwoRIVd8+8VK4nLHc2?=
 =?us-ascii?Q?bQpUuJ6hRdcS0d4qr2GVqsc41CfUagI1scGT7yF876/ut08Z5FCUkqEiJPvw?=
 =?us-ascii?Q?rxr+GV7URks4J/8Kq7NsjI1RbwO/kYray94F/Wg5rPgfrgQRBjQwFUO75Eaq?=
 =?us-ascii?Q?v0Dgh6+ZjxsAVYFvF+nr8jDekf7lUHrEvb3ACC+5Ye87R0AGwxLZxeJjzW2E?=
 =?us-ascii?Q?ugpirwvmasvYrSIzXH8ml+ADWyFbNceO3vWa6+YpbScE88Xm7/HFAQ3HqFEf?=
 =?us-ascii?Q?DlaUv7pwtLeDnQj4kXInmKgLdgFAwY0IYqtQJ7PWDt2X1kE7lVx0erxN/cuT?=
 =?us-ascii?Q?Lnu4l6svYbLXjdFebKF4414Sr1NQxq/MyXP+t2Fj64T1CnSoEXd2RKc1HNyY?=
 =?us-ascii?Q?wrM5pssrjJOH0h4OrqKlNY7pwpMlbQFs4t30+UNd85gdSKjOtRVeC/+LUpzd?=
 =?us-ascii?Q?6SZcAUsswcHzSUZOrbpELc+kRibr56UoovFJY8tseAR4a3pAH6l7xL/QhUPv?=
 =?us-ascii?Q?9DFiLAZpn23g9dvs1ODsb/dqO/OV/ymMJlt0Gsv28xZt+VBCpgDNS3HHmp44?=
 =?us-ascii?Q?2kBnUl83qufsPhjnFq4SAebw6/8EWz+eYURETTHMr5+FvHXQBW2zGPcK9T6Y?=
 =?us-ascii?Q?lrBXGIP8bLxegZTkduzVaQ+Vl0yoIzPIQbe8zBA+gdcluMt/zqnUCEp8t+71?=
 =?us-ascii?Q?3Ar7T79VSAlO1813LMpt8kjrBEPR+NMQFoHdRyg4SoHIvlwd5CeaOldbGlvl?=
 =?us-ascii?Q?SU+VS6tMPrndROzv/GKwIfl2PPCoJ/QYcaOLxT7Cnaow/3mK+G1YOEFZVrnn?=
 =?us-ascii?Q?L+avbDdz2PieuImlEsdRBfD+oX8a1Kc3njmHBpczgFnjNemy7TCIn2bkINL9?=
 =?us-ascii?Q?g8URxW//AMQ1aUfDdbfVWsM+DdXXKBJWmwH9RllX11CyBokjhDNh4tJHZEjS?=
 =?us-ascii?Q?SSzfzCVcBrgokdTCyFY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825daeb2-1edd-42ed-f9a3-08dacc55a7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 06:49:08.7096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylZ7Di8Wq0r4lEj0U8KvkW5iJhefaKBqoIjHrPXe6D+q8jNPZgKbQTagGv6yERGp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7730
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_DM5PR12MB17706C1E60B13D31E304B9C5B00D9DM5PR12MB1770namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Ping...

> -----Original Message-----
> From: Zhou1, Tao <Tao.Zhou1@amd.com>
> Sent: Wednesday, November 2, 2022 10:36 AM
> To: amd-gfx@lists.freedesktop.org; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Cc: Zhou1, Tao <Tao.Zhou1@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>
> Subject: [PATCH 2/2] drm/amdgpu: enable RAS poison for VCN 2.6
>=20
> Configure related settings to enable it.
>=20
> Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 29
> +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index 8a7006d62a87..43eefed30057 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -770,6 +770,33 @@ static void vcn_v2_5_enable_clock_gating(struct
> amdgpu_device *adev)
>  	}
>  }
>=20
> +static void vcn_v2_6_enable_ras(struct amdgpu_device *adev, int inst_idx=
,
> +				bool indirect)
> +{
> +	uint32_t tmp;
> +
> +	if (adev->ip_versions[UVD_HWIP][0] !=3D IP_VERSION(2, 6, 0))
> +		return;
> +
> +	tmp =3D VCN_RAS_CNTL__VCPU_VCODEC_REARM_MASK |
> +	      VCN_RAS_CNTL__VCPU_VCODEC_IH_EN_MASK |
> +	      VCN_RAS_CNTL__VCPU_VCODEC_PMI_EN_MASK |
> +	      VCN_RAS_CNTL__VCPU_VCODEC_STALL_EN_MASK;
> +	WREG32_SOC15_DPG_MODE(inst_idx,
> +			      SOC15_DPG_MODE_OFFSET(VCN, 0,
> regVCN_RAS_CNTL),
> +			      tmp, 0, indirect);
> +
> +	tmp =3D UVD_VCPU_INT_EN__RASCNTL_VCPU_VCODEC_EN_MASK;
> +	WREG32_SOC15_DPG_MODE(inst_idx,
> +			      SOC15_DPG_MODE_OFFSET(VCN, 0,
> regUVD_VCPU_INT_EN),
> +			      tmp, 0, indirect);
> +
> +	tmp =3D UVD_SYS_INT_EN__RASCNTL_VCPU_VCODEC_EN_MASK;
> +	WREG32_SOC15_DPG_MODE(inst_idx,
> +			      SOC15_DPG_MODE_OFFSET(VCN, 0,
> regUVD_SYS_INT_EN),
> +			      tmp, 0, indirect);
> +}
> +
>  static int vcn_v2_5_start_dpg_mode(struct amdgpu_device *adev, int inst_=
idx,
> bool indirect)  {
>  	volatile struct amdgpu_fw_shared *fw_shared =3D adev-
> >vcn.inst[inst_idx].fw_shared.cpu_addr;
> @@ -849,6 +876,8 @@ static int vcn_v2_5_start_dpg_mode(struct
> amdgpu_device *adev, int inst_idx, boo
>  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
>  		VCN, 0, mmUVD_LMI_CTRL2), 0, 0, indirect);
>=20
> +	vcn_v2_6_enable_ras(adev, inst_idx, indirect);
> +
>  	/* unblock VCPU register access */
>  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
>  		VCN, 0, mmUVD_RB_ARB_CTRL), 0, 0, indirect);
> --
> 2.35.1

--_000_DM5PR12MB17706C1E60B13D31E304B9C5B00D9DM5PR12MB1770namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
TImRQ1RSTP4ytgC4MrhPbT3CJG7/U4CfzobPRtd/uktrwy8qduD+bgJgaEE/gYGAlSIvARux5wDQ
apAEESovz//RD9Ifx9Mv1D/VT1JCX4JA5pDf1pLW79xZJ4k/0DNOYABQByPEFULqsAAAHwBCAAEA
AAAWAAAAWgBoAG8AdQAxACwAIABUAGEAbwAAAAAAHwBlAAEAAAAkAAAAVABhAG8ALgBaAGgAbwB1
ADEAQABhAG0AZAAuAGMAbwBtAAAAHwBkAAEAAAAKAAAAUwBNAFQAUAAAAAAAAgFBAAEAAABcAAAA
AAAAAIErH6S+oxAZnW4A3QEPVAIAAACAWgBoAG8AdQAxACwAIABUAGEAbwAAAFMATQBUAFAAAABU
AGEAbwAuAFoAaABvAHUAMQBAAGEAbQBkAC4AYwBvAG0AAAAfAAJdAQAAACQAAABUAGEAbwAuAFoA
aABvAHUAMQBAAGEAbQBkAC4AYwBvAG0AAAAfAOVfAQAAACwAAABzAGkAcAA6AHQAYQBvAC4AegBo
AG8AdQAxAEAAYQBtAGQALgBjAG8AbQAAAB8AGgwBAAAAFgAAAFoAaABvAHUAMQAsACAAVABhAG8A
AAAAAB8AHwwBAAAAJAAAAFQAYQBvAC4AWgBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQAAAB8AHgwB
AAAACgAAAFMATQBUAFAAAAAAAAIBGQwBAAAAXAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAgFoA
aABvAHUAMQAsACAAVABhAG8AAABTAE0AVABQAAAAVABhAG8ALgBaAGgAbwB1ADEAQABhAG0AZAAu
AGMAbwBtAAAAHwABXQEAAAAkAAAAVABhAG8ALgBaAGgAbwB1ADEAQABhAG0AZAAuAGMAbwBtAAAA
CwBAOgEAAAAfABoAAQAAABIAAABJAFAATQAuAE4AbwB0AGUAAAAAAAMA8T8JBAAACwBAOgEAAAAD
AP0/5AQAAAIBCzABAAAAEAAAAO15gdICIiZNp7FedQPY/0EDABcAAQAAAEAAOQAAivyEPv7YAUAA
CDBKDmSFPv7YAR8ANwABAAAAdAAAAFIARQA6ACAAWwBQAEEAVABDAEgAIAAyAC8AMgBdACAAZABy
AG0ALwBhAG0AZABnAHAAdQA6ACAAZQBuAGEAYgBsAGUAIABSAEEAUwAgAHAAbwBpAHMAbwBuACAA
ZgBvAHIAIABWAEMATgAgADIALgA2AAAAHwA9AAEAAAAKAAAAUgBFADoAIAAAAAAAAwDeP59OAAAL
AAIAAQAAAAsAIwAAAAAAAwAmAAAAAAALACkAAAAAAAsAKwAAAAAAAwAuAAAAAAADADYAAAAAAB8A
cAABAAAAbAAAAFsAUABBAFQAQwBIACAAMgAvADIAXQAgAGQAcgBtAC8AYQBtAGQAZwBwAHUAOgAg
AGUAbgBhAGIAbABlACAAUgBBAFMAIABwAG8AaQBzAG8AbgAgAGYAbwByACAAVgBDAE4AIAAyAC4A
NgAAAAIBcQABAAAAGwAAAAEB2O5kQybrnb6OlDpDmgX01kt+Rm+uSqAl0AALAAYMAAAAAB8ANRAB
AAAAogAAADwARABNADUAUABSADEAMgBNAEIAMQA3ADcAMAA2AEMAMQBFADYAMABCADEAMwBEADMA
MQBFADMAMAA0AEIAOQBDADUAQgAwADAARAA5AEAARABNADUAUABSADEAMgBNAEIAMQA3ADcAMAAu
AG4AYQBtAHAAcgBkADEAMgAuAHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0APgAAAAAA
HwA5EAEAAACsAAAAPAAyADAAMgAyADEAMQAwADIAMAAyADMANgAwADgALgAxADcAMgA0ADIALQAx
AC0AdABhAG8ALgB6AGgAbwB1ADEAQABhAG0AZAAuAGMAbwBtAD4AIAA8ADIAMAAyADIAMQAxADAA
MgAwADIAMwA2ADAAOAAuADEANwAyADQAMgAtADIALQB0AGEAbwAuAHoAaABvAHUAMQBAAGEAbQBk
AC4AYwBvAG0APgAAAB8AQhABAAAAVgAAADwAMgAwADIAMgAxADEAMAAyADAAMgAzADYAMAA4AC4A
MQA3ADIANAAyAC0AMgAtAHQAYQBvAC4AegBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQA+AAAAAAAD
AIAQ/////wMAExIAAAAAQAAHMGjrHoU+/tgBAgEQMAEAAABGAAAAAAAAAJ4de9IKz75Al0jP29Yh
G3sHAKg4md52MvxGiTPxn/b8aCUAAAAAAQsAAKg4md52MvxGiTPxn/b8aCUAAfZNwT4AAAAAAgET
MAEAAAAQAAAAJuudvo6UOkOaBfTWS35GbwIBFDABAAAADAAAALcAAADiXdgsWwAAAAMAWzMBAAAA
AwBaNgAAAAADAGg2DQAAAAsA+jYBAAAAHwDZPwEAAAAAAgAAWwBBAE0ARAAgAE8AZgBmAGkAYwBp
AGEAbAAgAFUAcwBlACAATwBuAGwAeQAgAC0AIABHAGUAbgBlAHIAYQBsAF0ADQAKAA0ACgBQAGkA
bgBnAC4ALgAuAA0ACgANAAoAPgAgAC0ALQAtAC0ALQBPAHIAaQBnAGkAbgBhAGwAIABNAGUAcwBz
AGEAZwBlAC0ALQAtAC0ALQANAAoAPgAgAEYAcgBvAG0AOgAgAFoAaABvAHUAMQAsACAAVABhAG8A
IAA8AFQAYQBvAC4AWgBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQA+AA0ACgA+ACAAUwBlAG4AdAA6
ACAAVwBlAGQAbgBlAHMAZABhAHkALAAgAE4AbwB2AGUAbQBiAGUAcgAgADIALAAgADIAMAAyADIA
IAAxADAAOgAzADYAIABBAE0ADQAKAD4AIABUAG8AOgAgAGEAbQBkAC0AZwBmAHgAQABsAGkAcwB0
AHMALgBmAHIAZQBlAGQAZQBzAGsAdABvAHAALgBvAHIAZwA7ACAAWgBoAGEAbgBnACwAIABIAGEA
dwBrAGkAbgBnAA0ACgA+ACAAPABIAGEAdwBrAGkAbgBnAC4AWgBoAGEAbgBnAEAAYQBtAGQALgBj
AG8AbQA+ADsAIABEAGUAdQBjAGgAZQByACwAIABBAGwAAAAfAPg/AQAAABYAAABaAGgAbwB1ADEA
LAAgAFQAYQBvAAAAAAAfAPo/AQAAABYAAABaAGgAbwB1ADEALAAgAFQAYQBvAAAAAAAfACJAAQAA
AAYAAABFAFgAAAAAAB8AI0ABAAAAAAEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBMAEEAQgBTAC8A
TwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBFACAARwBS
AE8AVQBQACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBOAD0AUgBFAEMA
SQBQAEkARQBOAFQAUwAvAEMATgA9ADcANwAzAEQAMABFADAAQwA5ADEAQwA3ADQAOABBADYAOQBE
ADIAMgA2ADQAMwBDADEAOABCAEQAOQA5AEEARgAtAFoASABPAFUAMQAsACAAVABBAE8AAAAfACRA
AQAAAAYAAABFAFgAAAAAAB8AJUABAAAAAAEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBMAEEAQgBT
AC8ATwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBFACAA
RwBSAE8AVQBQACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBOAD0AUgBF
AEMASQBQAEkARQBOAFQAUwAvAEMATgA9ADcANwAzAEQAMABFADAAQwA5ADEAQwA3ADQAOABBADYA
OQBEADIAMgA2ADQAMwBDADEAOABCAEQAOQA5AEEARgAtAFoASABPAFUAMQAsACAAVABBAE8AAAAf
ADBAAQAAABYAAABaAGgAbwB1ADEALAAgAFQAYQBvAAAAAAAfADFAAQAAABYAAABaAGgAbwB1ADEA
LAAgAFQAYQBvAAAAAAAfADhAAQAAABYAAABaAGgAbwB1ADEALAAgAFQAYQBvAAAAAAAfADlAAQAA
ABYAAABaAGgAbwB1ADEALAAgAFQAYQBvAAAAAAADAFlAAAAAAAMAWkAAAAAAAwA3UAEAAAADAAlZ
AQAAAB8ACl0BAAAAJAAAAFQAYQBvAC4AWgBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQAAAB8AC10B
AAAAJAAAAFQAYQBvAC4AWgBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQAAAAIBFV0BAAAAEgAAAAIf
ltg9iORgTo4RqC2ZThg9AQAAAgEWXQEAAAASAAAAAh+W2D2I5GBOjhGoLZlOGD0BAAALAACACCAG
AAAAAADAAAAAAAAARgAAAAAUhQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAQAAADIAAABFAHgA
YwBoAGEAbgBnAGUAQQBwAHAAbABpAGMAYQB0AGkAbwBuAEYAbABhAGcAcwAAAAAAIAAAAB8AAIAT
j/JB9IMUQaWE7ttaawv/AQAAABYAAABDAGwAaQBlAG4AdABJAG4AZgBvAAAAAAABAAAAKgAAAEMA
bABpAGUAbgB0AD0ATQBTAEUAeABjAGgAYQBuAGcAZQBSAFAAQwAAAAAACwAAgAggBgAAAAAAwAAA
AAAAAEYAAAAABoUAAAAAAAALAACACCAGAAAAAADAAAAAAAAARgAAAAADhQAAAAAAAAMAAIAIIAYA
AAAAAMAAAAAAAABGAAAAAAGFAAAAAAAAAgEAgBOP8kH0gxRBpYTu21prC/8BAAAALgAAAEgAZQBh
AGQAZQByAEIAbwBkAHkARgByAGEAZwBtAGUAbgB0AEwAaQBzAHQAAAAAAAEAAAA2AAAAAQAKAAAA
BAAAAAEAAAAUAAAAAAAAAAAAAAAwAAAAAAAAABQAAAAAAAAACAEAAP////8AAAAAAAALAACAE4/y
QfSDFEGlhO7bWmsL/wEAAAAcAAAASABhAHMAUQB1AG8AdABlAGQAVABlAHgAdAAAAAEAAAALAACA
E4/yQfSDFEGlhO7bWmsL/wEAAAAoAAAASQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAQwBoAGEAbgBn
AGUAZAAAAAEAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAABAAAAAQwBvAG4AdgBlAHIAcwBhAHQA
aQBvAG4AVAByAGUAZQBQAGEAcgBlAG4AdABSAGUAYwBvAHIAZABLAGUAeQAAAAEAAAAuAAAAAAAA
AJ4de9IKz75Al0jP29YhG3sBAKg4md52MvxGiTPxn/b8aCUABJf9Vt4AAAAAHwAAgB+k6zOoei5C
vnt54amOVLMBAAAAOAAAAEMAbwBuAHYAZQByAHMAYQB0AGkAbwBuAEkAbgBkAGUAeABUAHIAYQBj
AGsAaQBuAGcARQB4AAAAAQAAAOYBAABJAEkAPQBbAEMASQBEAD0AYgBlADkAZABlAGIAMgA2AC0A
OQA0ADgAZQAtADQAMwAzAGEALQA5AGEAMAA1AC0AZgA0AGQANgA0AGIANwBlADQANgA2AGYAOwBJ
AEQAWABIAEUAQQBEAD0AMAAxAEQAOABFAEUANgA0ADQAMwA7AEkARABYAEMATwBVAE4AVAA9ADIA
XQA7AFMAQgBNAEkARAA9ADMANAA7AFMAMQA9ADwAMgAwADIAMgAxADEAMAAyADAAMgAzADYAMAA4
AC4AMQA3ADIANAAyAC0AMgAtAHQAYQBvAC4AegBoAG8AdQAxAEAAYQBtAGQALgBjAG8AbQA+ADsA
UgBUAFAAPQBEAGkAcgBlAGMAdABDAGgAaQBsAGQAOwBUAEQATgA9AE0AaQBzAG0AYQB0AGMAaAA7
AFQAUAA9AFMAYQBtAGUAOwBUAEYAUgA9AE4AbwB0AEYAbwByAGsAaQBuAGcAOwBWAGUAcgBzAGkA
bwBuAD0AVgBlAHIAcwBpAG8AbgAgADEANQAuADIAMAAgACgAQgB1AGkAbABkACAANQA4ADMANAAu
ADAAKQAsACAAUwB0AGEAZwBlAD0ASAAxADsAVQBQAD0ARAAwADsARABQAD0AMQAwADEAAAAAAAMA
AIAIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAAAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAGIUA
AAAAAAALAACACCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABG
AAAAAIKFAAAAAAAAHwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA2IUAAAEAAAASAAAASQBQAE0ALgBO
AG8AdABlAAAAAAADAACAUONjC8yc0BG82wCAX8zOBAEAAAAkAAAASQBuAGQAZQB4AGkAbgBnAEUA
cgByAG8AcgBDAG8AZABlAAAAGwAAAB8AAIBQ42MLzJzQEbzbAIBfzM4EAQAAACoAAABJAG4AZABl
AHgAaQBuAGcARQByAHIAbwByAE0AZQBzAHMAYQBnAGUAAAAAAAEAAABwAAAASQBuAGQAZQB4AGkA
bgBnACAAUABlAG4AZABpAG4AZwAgAHcAaABpAGwAZQAgAEIAaQBnAEYAdQBuAG4AZQBsAFAATwBJ
AEkAcwBVAHAAVABvAEQAYQB0AGUAIABpAHMAIABmAGEAbABzAGUALgAAAAsAAIBQ42MLzJzQEbzb
AIBfzM4EAQAAACYAAABJAHMAUABlAHIAbQBhAG4AZQBuAHQARgBhAGkAbAB1AHIAZQAAAAAAAAAA
AAIBAIAIIAYAAAAAAMAAAAAAAABGAQAAADYAAABJAG4AVAByAGEAbgBzAGkAdABNAGUAcwBzAGEA
ZwBlAEMAbwByAHIAZQBsAGEAdABvAHIAAAAAAAEAAAAQAAAAZoLKbQWSLkiF+nGuRq6vjB8AAICG
AwIAAAAAAMAAAAAAAABGAQAAABgAAABtAHMAaQBwAF8AbABhAGIAZQBsAHMAAAABAAAACgQAAE0A
UwBJAFAAXwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAt
ADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAEUAbgBhAGIAbABlAGQAPQB0AHIA
dQBlADsAIABNAFMASQBQAF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAt
ADQAYgA1ADgALQA4ADQAYgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBTAGUAdABEAGEA
dABlAD0AMgAwADIAMgAtADEAMQAtADIAMgBUADAANgA6ADQAOQA6ADAANQBaADsAIABNAFMASQBQ
AF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4ADQA
YgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBNAGUAdABoAG8AZAA9AFMAdABhAG4AZABh
AHIAZAA7ACAATQBTAEkAUABfAEwAYQBiAGUAbABfADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQA
LQA0AGIANQA4AC0AOAA0AGIAZgAtADMAOABiAGUAZAA2ADEANwAwAGEAMABmAF8ATgBhAG0AZQA9
AEcAZQBuAGUAcgBhAGwAOwAgAE0AUwBJAFAAXwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUA
LQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBf
AFMAaQB0AGUASQBkAD0AMwBkAGQAOAA5ADYAMQBmAC0AZQA0ADgAOAAtADQAZQA2ADAALQA4AGUA
MQAxAC0AYQA4ADIAZAA5ADkANABlADEAOAAzAGQAOwAgAE0AUwBJAFAAXwBMAGEAYgBlAGwAXwA0
ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQA
NgAxADcAMABhADAAZgBfAEEAYwB0AGkAbwBuAEkAZAA9AGMAOAAwAGQANwAwAGYAMQAtADIAOAA4
AGMALQA0ADcAOAAzAC0AOAA0ADUAYQAtADEAMQBmADAAZgA4AGYAYgBiADgAMQBhADsAIABNAFMA
SQBQAF8ATABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4
ADQAYgBmAC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBDAG8AbgB0AGUAbgB0AEIAaQB0AHMA
PQAxAAAAAABIAACAa8U/QDDNxUeG+O3p41oCKwEAAAAcAAAATQBTAEkAUABMAGEAYgBlAGwARwB1
AGkAZAAAAE4xQkP0DVhLhL84vtYXCg8fAACAhgMCAAAAAADAAAAAAAAARgEAAABwAAAAbQBzAGkA
cABfAGwAYQBiAGUAbABfADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQALQA0AGIANQA4AC0AOAA0
AGIAZgAtADMAOABiAGUAZAA2ADEANwAwAGEAMABmAF8AZQBuAGEAYgBsAGUAZAAAAAEAAAAKAAAA
dAByAHUAZQAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAcAAAAG0AcwBpAHAAXwBsAGEAYgBl
AGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgA
YgBlAGQANgAxADcAMABhADAAZgBfAHMAZQB0AGQAYQB0AGUAAAABAAAAKgAAADIAMAAyADIALQAx
ADEALQAyADIAVAAwADYAOgA0ADkAOgAwADUAWgAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
bgAAAG0AcwBpAHAAXwBsAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABi
ADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAG0AZQB0AGgAbwBkAAAA
AAABAAAAEgAAAFMAdABhAG4AZABhAHIAZAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAagAA
AG0AcwBpAHAAXwBsAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUA
OAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAG4AYQBtAGUAAAAAAAEAAAAQ
AAAARwBlAG4AZQByAGEAbAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAG4AAABtAHMAaQBwAF8A
bABhAGIAZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4ADQAYgBm
AC0AMwA4AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBzAGkAdABlAGkAZAAAAAAAAQAAAEoAAAAzAGQA
ZAA4ADkANgAxAGYALQBlADQAOAA4AC0ANABlADYAMAAtADgAZQAxADEALQBhADgAMgBkADkAOQA0
AGUAMQA4ADMAZAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAcgAAAG0AcwBpAHAAXwBsAGEA
YgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAz
ADgAYgBlAGQANgAxADcAMABhADAAZgBfAGEAYwB0AGkAbwBuAGkAZAAAAAAAAQAAAEoAAAA0AGMA
YwA1ADkAOAA5AGUALQBhAGMAZgBhAC0ANABhAGQAYgAtADkAMwAzADcALQA2ADYAOAAyADYAMgBl
ADMANQBjADUANwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAeAAAAG0AcwBpAHAAXwBsAGEA
YgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAz
ADgAYgBlAGQANgAxADcAMABhADAAZgBfAGMAbwBuAHQAZQBuAHQAYgBpAHQAcwAAAAEAAAAEAAAA
MAAAAAMADTT9PwAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAALgAAAGEAdQB0AGgAZQBuAHQAaQBj
AGEAdABpAG8AbgAtAHIAZQBzAHUAbAB0AHMAAAAAAAEAAACyAAAAZABrAGkAbQA9AG4AbwBuAGUA
IAAoAG0AZQBzAHMAYQBnAGUAIABuAG8AdAAgAHMAaQBnAG4AZQBkACkAIABoAGUAYQBkAGUAcgAu
AGQAPQBuAG8AbgBlADsAZABtAGEAcgBjAD0AbgBvAG4AZQAgAGEAYwB0AGkAbwBuAD0AbgBvAG4A
ZQAgAGgAZQBhAGQAZQByAC4AZgByAG8AbQA9AGEAbQBkAC4AYwBvAG0AOwAAAAAAHwAAgIYDAgAA
AAAAwAAAAAAAAEYBAAAAHgAAAGEAYwBjAGUAcAB0AGwAYQBuAGcAdQBhAGcAZQAAAAAAAQAAAAwA
AABlAG4ALQBVAFMAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAgAAAAeAAtAG0AcwAtAGgAYQBz
AC0AYQB0AHQAYQBjAGgAAAABAAAAAgAAAAAAAAAfAACAa8U/QDDNxUeG+O3p41oCKwEAAAASAAAA
TQBJAFAATABhAGIAZQBsAAAAAAABAAAAzAEAAFsAewAiAGkAZAAiADoAIgA0ADMANAAyADMAMQA0
AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAA
ZgAiACwAIgB0AGkAIgA6ACIAMwBkAGQAOAA5ADYAMQBmAC0AZQA0ADgAOAAtADQAZQA2ADAALQA4
AGUAMQAxAC0AYQA4ADIAZAA5ADkANABlADEAOAAzAGQAIgAsACIAcABpACIAOgAiADAAMAAwADAA
MAAwADAAMAAtADAAMAAwADAALQAwADAAMAAwAC0AMAAwADAAMAAtADAAMAAwADAAMAAwADAAMAAw
ADAAMAAwACIALAAiAG4AbQAiADoAIgBHAGUAbgBlAHIAYQBsACIALAAiAGEAYwAiADoAMQAsACIA
bwBwACIAOgAxACwAIgBjAHQAIgA6ACIAMgAwADIAMgAtADEAMQAtADIAMgBUADAANgA6ADQAOQA6
ADAANQBaACIALAAiAG0AdAAiADoAIgAwADAAMAAxAC0AMAAxAC0AMAAxAFQAMAAwADoAMAAwADoA
MAAwACIALAAiAHUAYwAiADoAbgB1AGwAbAB9AF0AAABIAACACCAGAAAAAADAAAAAAAAARgEAAAAi
AAAATgBlAHQAdwBvAHIAawBNAGUAcwBzAGEAZwBlAEkAZAAAAAAAsq5dgt0e7UL5owjazFWn5h8A
AICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAAB4AC0AbQBzAC0AcAB1AGIAbABpAGMAdAByAGEAZgBm
AGkAYwB0AHkAcABlAAAAAAABAAAADAAAAEUAbQBhAGkAbAAAAB8AAICGAwIAAAAAAMAAAAAAAABG
AQAAADYAAAB4AC0AbQBzAC0AdAByAGEAZgBmAGkAYwB0AHkAcABlAGQAaQBhAGcAbgBvAHMAdABp
AGMAAAAAAAEAAABIAAAARABNADUAUABSADEAMgBNAEIAMQA3ADcAMAA6AEUARQBfAHwAQwBZADgA
UABSADEAMgBNAEIANwA3ADMAMAA6AEUARQBfAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAUAAA
AHgALQBtAHMALQBvAGYAZgBpAGMAZQAzADYANQAtAGYAaQBsAHQAZQByAGkAbgBnAC0AYwBvAHIA
cgBlAGwAYQB0AGkAbwBuAC0AaQBkAAAAAQAAAEoAAAA4ADIANQBkAGEAZQBiADIALQAxAGUAZABk
AC0ANAAyAGUAZAAtAGYAOQBhADMALQAwADgAZABhAGMAYwA1ADUAYQA3AGUANgAAAAAAHwAAgIYD
AgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBzAGUAbgBk
AGUAcgBhAGQAYwBoAGUAYwBrAAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
OgAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBhAG4AdABpAHMAcABhAG0ALQByAGUAbABh
AHkAAAAAAAEAAAAEAAAAMAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACoAAAB4AC0AbQBpAGMA
cgBvAHMAbwBmAHQALQBhAG4AdABpAHMAcABhAG0AAAAAAAEAAAAOAAAAQgBDAEwAOgAwADsAAAAA
AB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEQAAAB4AC0AbQBpAGMAcgBvAHMAbwBmAHQALQBhAG4A
dABpAHMAcABhAG0ALQBtAGUAcwBzAGEAZwBlAC0AaQBuAGYAbwAAAAEAAACyBQAAWgBCAEEARQBE
AEEAcgBOAG8AbwBqAGQAbABnAGkAQwB1ADgAMQBSAHYAZgBJADEAeQB6AHQAOQB0AEoAawBmAGIA
dABHADcAbgBOADkAZgB4AFcAaQA1ADIAMgBZAFMARwA0AHYANgBXAFMASwBzAFAARwB3AE8ATQA5
AEMAYQA2ADgAYQBYAEsAWQBnADkAaABwAFMAUgB2AFkATQBKAFUAWQA5AGoATQB1AGwAYgBCAEgA
awBuAE0AVwAzAHIAaQA4AEUAYgA3AGcAYgBsAFoAagA4AG8ANwBpAGsAeABwAG4AVQBGAFoAeQB6
AFYARwBpAEMANwBUAE0AWABwAGUATQBWAHgARABMADEARABTAG8ANQBlAHMASgAyAGQAVAA2AFcA
RwBvADkAaABmAEEAbQB6ADcAdgBNAHMAOQB1AE0AdAAxAFkALwBaAFcAbwBZAEUAdQBoADEAcABI
AFYAMAB4AFAASgBCAHQAVgB2AGQASABPAEIATQBUADAAVABxADAAawBUADAAOABOAHQAYwBGAFoA
egBuAE8AZQB4AEMATQAxAFcAWQBPAHgAdQBDAGYAbABUAGcAbAAxAHUAbQBPAGQAcAAvAEcAcwBX
AFYANwArAFIATABvAEwASgBqADkATQBVAHYANwA2AHcAWgBrAC8AZwAxADAAZQBVAGQAKwBKAHEA
dQA0AGEAbwBGAGQANAArAEQAbQBQAG8ATQBFACsAbwBQAE4AZwByADYAcABjADAASgAyAEIAdAB4
AHQAYQBiAFcAaABoAEEANQBMAHAAOABzAHoANgA2AGEAVABmADYAQwBOAC8AZgA5AEgAbQBuAEYA
NwBQAFIAZAArAEUAegBpADAAagBYAEIAOAB1AFQAQgB6AEQANgBnAEkAQgBEAE0AawBmAHkAUwBG
AGcASQBZACsAUQBsAGQATgBtAFEAbABxAEUAZwB5AEwAbABpAHMARQBpAG4AbgByAGgAUABTAGcA
eQBmAGsAKwBqADIAbABKAFIAUQByAHQATQB0ADgAUwA2ADEAMgArAGwAeQAvAGYAagBLAG8AbgBh
AGMAYgB2AEMAZwByAGEAMwB3AGIAYwBBAEsAOAAvAGgARQBSAE4AMABxAFoAUgB6ADcASQBXADcA
ZwAzAFUAeQAyAFYALwBWAGEAbwB1AHkAeQBnAHoAKwBCAGsAKwByADIAcgBnAGEAYwA3AGwAbABv
AGEAcAA0AFAAdwBSAHQAVQBiAHgATgBPAC8AegBvAGcAUABBAEMAcgBVAGQAZgBJAHcAVwBtADAA
WQA2AEoANAAyAFQAQgAvAE0AWQBXAFUAOQBnAEMAYwBaAHgARgBHAEEAeQA0ADUAMABNAE8AUABy
AHkAYgBEAFIAUwA5ACsAegA3AEoAUgAxAFAAeABjAEcAZAArAGQAegBMAFYAYwArAFcAUAA5ACsA
cgBKAEQAQQBKAFgAMAA4AHAAMgBGAHMARwA1AGEASABjAFYAcwByAEcAOQA4AGcAUgAzAHAANABh
ADAAcgA2AHMARgA0AGQAeQBvADAAUwB3AHAAbABEAEMAVwBtAE8AWgBVADAAYwBSAE8AVQBHAGQA
UgB4ADYASwBDADAAYwB2AHoAcgBiAHoARABXAFAARABaAGkAOABUAHEAcABRACsAQwBHAG0AbAA1
AEYAWQBpAEsASQA4AEoAcgBDAGEAcQB5AEkARQBYAFoAVwByAFIAQgA2AHIAWQA5AGgAUAB4AHIA
dQAxAHcAZgBRAEEAZwBpADAANABBAFMAaQBQACsARwBkAFQAeABoADQAbwAwAGQAMQBxADgAcwA4
ADMAbgBrAHAASgBuAEIAdAAxADQAbAA4AEwAcgBwAGQAMwB3AEUAUgBaADcARQA4AE8AdwA1AHkA
OQBnAHoAagA3ADUAawBhAGcAPQA9AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA4AAAAeAAt
AGYAbwByAGUAZgByAG8AbgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AcgBlAHAAbwByAHQAAAABAAAA
NgQAAEMASQBQADoAMgA1ADUALgAyADUANQAuADIANQA1AC4AMgA1ADUAOwBDAFQAUgBZADoAOwBM
AEEATgBHADoAZQBuADsAUwBDAEwAOgAxADsAUwBSAFYAOgA7AEkAUABWADoATgBMAEkAOwBTAEYA
VgA6AE4AUwBQAE0AOwBIADoARABNADUAUABSADEAMgBNAEIAMQA3ADcAMAAuAG4AYQBtAHAAcgBk
ADEAMgAuAHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0AOwBQAFQAUgA6ADsAQwBBAFQA
OgBOAE8ATgBFADsAUwBGAFMAOgAoADEAMwAyADMAMAAwADIAMgApACgANAA2ADMANgAwADAAOQAp
ACgAMwA5ADgANgAwADQAMAAwADAAMAAyACkAKAAxADMANgAwADAAMwApACgAMwA0ADYAMAAwADIA
KQAoADMANwA2ADAAMAAyACkAKAAzADYANgAwADAANAApACgAMwA5ADYAMAAwADMAKQAoADQANQAx
ADEAOQA5ADAAMQA1ACkAKAAyADYAMAAwADUAKQAoADMAOAAwADcAMAA3ADAAMAAwADAANQApACgA
MgA5ADAANgAwADAAMgApACgAOAA2ADMANgAyADAAMAAxACkAKAA5ADYAOAA2ADAAMAAzACkAKAA4
ADMAMwA4ADAANAAwADAAMAAwADEAKQAoADMAOAAxADAAMAA3ADAAMAAwADAAMgApACgANgA2ADQA
NwA2ADAAMAA3ACkAKAA4ADYANwA2ADAAMAAyACkAKAAxADIAMgAwADAAMAAwADAAMQApACgAMwAz
ADYANQA2ADAAMAAyACkAKAA0ADMAMgA2ADAAMAA4ACkAKAA2ADYANAA0ADYAMAAwADgAKQAoADYA
NgA1ADUANgAwADAAOAApACgANQA1ADAAMQA2ADAAMAAzACkAKAA3ADEAMgAwADAANAAwADAAMAAw
ADEAKQAoADYANAA3ADUANgAwADAAOAApACgANwA2ADEAMQA2ADAAMAA2ACkAKAA0ADEAMwAwADAA
NwAwADAAMAAwADEAKQAoADYANgA5ADQANgAwADAANwApACgANgA2ADMANgAwADAAMgApACgANQAy
ADUAMwA2ADAAMQA0ACkAKAAxADEAMAAxADMANgAwADAANQApACgANQAzADUANAA2ADAAMQAxACkA
KAA4ADkAMwA2ADAAMAAyACkAKAA1ADYANgAwADMAMAAwADAAMAAyACkAKAAzADEANgAwADAAMgAp
ACgAMQA4ADYAMAAwADMAKQAoADcANgA5ADYAMAAwADUAKQAoADYANQAwADYAMAAwADcAKQAoADQA
NwA4ADYAMAAwADAAMAAxACkAOwBEAEkAUgA6AE8AVQBUADsAUwBGAFAAOgAxADEAMAAxADsAAAAA
AB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAFwAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBlAC0A
YQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBkAGEAdABhAC0AYwBoAHUAbgBrAGMAbwB1
AG4AdAAAAAEAAAAEAAAAMQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEoAAAB4AC0AbQBzAC0A
ZQB4AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBkAGEAdABh
AC0AMAAAAAAAAQAAAFoMAABwAHoAYwB5AEkAdABqAGwAVwA4AE4ANgBQAEcARgBoAFgARQBFAHUA
QQBPAGEAUgB2AG4AVgBxAGEAcQBMAEsASQBYAGcAbQBsAFIAYwB0AG8ATwBEAGIAcAAzADUALwA1
AEwAdgBhAEYAMABKAEEAZwAwAFgAdgA4AHQAOABqADAAZwBoAGcAKwBEAFkAQgBlAG4ARgBvAHEA
ZgBqAG0AQQBaAFAASwBjAG8AaAA5AFYARQBIAEMAYQBjAHMAawBHAHkARABOAGoAZABkAFgAWQBF
AGEANwBNACsAUQB3AHoAeABzADQAMwA4AHAANgBNAGwAMwB3AEkARQAxAE8AWABxAE0AUAArAHkA
RwBQAFoATABMAFUAaQB3AFMAOABYAFEAVQBWAGkAZQBWAGwAawBEAFYAMAByADIAbgBxAFgAQwAz
AFoARABEAFEAQgA0AG4AOQBwAGYALwBlAGgAUQBDAEUAcQBOAEEAdgA2AEcAbgA4AGUAOQBBAGgA
WAA0AEcAMQBjAFYAdwBBADIAUABrADUAagB5AGIAOABWAFgAQgBCAHkAUQBTAEUAcAByAGkALwB1
AEcAdAA5AGIAcgB5AEkAbwByAEsAMQBIADEAQQBOAGYAZAAyAHQATQA0AGQAbABtAEkAQQBYAGMA
ZAA3ACsAOQBSAE0AVwB6AEwAOAA5AC8AVgBmAFYANABMAHgAaABmAEkANwByAFIAeQBKAG8ARAA2
ADMAWQBGAHYAWABqAEYAUwA1AHMAQgAyADQAKwBVAGwAKwBWAHMAMwB5AFEAVwBIAGwAUwArAFgA
NQA3ACsAZQB3AFMARAAvAFcAbABoAFoAVABLAHAAdwAzAEsAbgBBAE0AdAAvAFgASgB3ADAAegBw
AHQAVgBPAG8AawAwAEMAVAB3AEQAdgBDAFEAZAB0AEYAWgA4ADYANwBlAE8AMABOAFAAYgBhADcA
VAA0ADIAYwBhAEQAawBrAFIAOABmAGIAdQBUAHgAdgBHAE8AMwBxAFAAZQB0AEoAVwBPAHEAZwBZ
AFAAOABRAFMAcgAwAC8AdwBQAC8AUQBvAHkAVwBlAFAASABoAEcAZQBNAHgAUgAvAEMASgAvAE0A
cwBFAFIAdABxAGsASABFAHEATABPAE4AegBhAGcAUAB5AFcAUwB2AHoAQQBDAEsAWgBWAGUAdABz
AEIAWABvAGcAagBRAEQAWgAwAE8ASQByAHQAawBwAHEAOABtAHkAawBnAG4AZwA3ACsAaQAyAHMA
cABQAEwAUgBSAEUAVAB4AHAAbgA2ADQAaQA2ADcAaQB4AEYAawBLAEoAZABRAHEAOQBZAGUAbgBU
AFQAaQBRAHQAZgBjAEQAUABiAGkAVwBTAGIAZQBnAHEAMQBRAFIASAAwAGQAWgBIAEoARAB0AHgA
QQBvAE8AMgBaADMAZABKAFAAWgAyAFYAdgBYAE4AZQB0AEsAYQBxAFIAMQBaAGQAMwBCAGIANQBL
AE4ANwBhAGgAdwB5ADEAWABDAE8ARwB4AFcALwBDAEEAMgBrADgAcwBRAHcAaABJAGIASABkAGgA
MgAxAEUAZQAwAHYAOQBmAGEAYwBtAHYAegBaAG8ANgAzAGUAbwBDAGgAbQAxAGIAQgBDADkALwBE
AFoAOABIAEwAVAB5ADQATwB0AC8AcABTAFcAZgBuAGsAbgBmAGwAZABsAHIAcwBuAHcAbwBSAEkA
VgBkADgAKwA4AFYASwA0AG4ATABIAGMAMgBiAFEAcABVAHUASgA2AGgAUgBkAGMAUwAwAGQANABx
AHIAMgBHAFYAcQBzAGMANAAxAEMAZgBVAGEAZwBJADEAcwBjAEcAVAA3AHkARgA4ADcANgAvAHUA
dAAwADgAWgA1AEYAQwBVAGsAcQBFAGkASgBQAHYAdwByAHgAcgArAEcAVgA3AFUAUgBrAHMANABK
AC8AOABLAHEANwBOAHMAagBJADEAUgBiAHcATwAvAGsAWQByAGEAeQA5ADQARgAvAFcAZwA1AHIA
UABnAGYAcgBnAFEAUgBCAGoAUQB3AEYAVQBPADcANQBFAGEAcQB2ADAARABnAGgANgArAFoAagB4
AHMAQQBWAFkARgB2AEYAKwBuAHIAOABqAEQAZQBrAGYANwBsAFUASAByAEUAdgBiADMAQQBDAEMA
KwA1AFkAZQA4ADcAUgAwAEEARwB3AHgATABaAHgAZQBKAGoAegBXADIARQB1AGcAcABpAHIAdwB2
AG0AYQBzAHYAWQByAFMASQB6AFgASAA4AG0AbAArAEEARABXAHkARgBiAE4AYwBlAE8AMwB2AFcA
YQA2ACsAWQBwAGIAUwBjAEUAOAA4AFgAbQA3AC8ASABGAEEAUQAzAEgAcQBGAEUAZgBEAGwAYQBV
AHYANwBwAHcAdABMAGUARABuAFEAagA0AGsAWABJAG4AbQBLAGcATABkAGcARgBBAHcAWQAwAEkA
WQBxAHQAUQBKADcAUABXAEQAdAAyAFgAMQBrAEUANwBsAFYAeAAwAGUAcgB4AE4ALwBjAHUAVABM
AG4AdQA0AGwANgBzAHYAWQBiAEwAWABqAGQARgBlAGIASwBGADQANAAxADQAUwByADEATgBRAHgA
cQAvAE0AeQBYAFAAKwB0ADIARgBqADYANABUADEAQwBuAFMAbwBFAFgAZAAyAFIASwBjADEASABO
AHkAWQB3AHIATQA1AHAAcwBzAHIAagBKAE8ASAAwAGgANABPAHIAcQBLAGwATgBZADcAcAB3AHAA
TQBsAGIAUQBGAHMANAB0ADMAMAArAFUATgBkADgANQBnAGQAUwBLAGoATwB0AFIAVgBlAEMALwAr
AEwAVQBwAHoAZAA2AFMAWgBjAEEAVQBzAHMAdwBjAEgAegBTAFUAWgBPAHIAYgBwAEUATABjACsA
awBSAGkAYgByADUANgBVAG8AbwB2AEYASgBZADgAdABzAGUAQQBSADQAYQAzAHAAQQBIADYAbAA3
AHgATAAvAFEAaABVAFAAdgA5AEQARgBpAEwAQQBaAHAAbgAyADMAZwA5AGQAdgBzADEATwBEAHMA
YgAvAGQAcQBPAC8ATwBWAC8AeQBtAE0ASgBsAHQAMABHAHMAdgAyADgAeABaAHQAKwBWAEIAQwBw
AGcARABOAFMAMwBIAEgAbQBwADQANAAyAGsAQgBuAFUAbAA4ADMAcQB1AGYAcwBQAGgAagBuAEYA
cQA0AFMAQQBlAGIAdwA2AC8AOABFAFcAegArAGUAWQBVAFIARQBUAFQASABNAHIANQArAEYAdgBI
AFgAUQBCAFcAMgB6AEcAUABjAEsAOQBUADYAWQBsAHIAQgBYAEcASQBQADgAYgBMAHgAZQBnAFoA
VABrAGQAdQB6AFYAYQBRACsAVgBsADAAeQBvAEkAegBQAEkAUQBiAGUAOAB6AEIAQQArAGcAZABj
AGwAdQBNAHQALwB6AHEAbgBVAEMARQBwADgAdAArADcAMQAzAEEAcgA3AFQANwA5AFYAUwBBAGwA
TwAxADgAMQAzAEwATQBwAHQAOABrAGoAcgBCAEUAUABSACsATgBNAFEARgBvAEgAZABSAHkAZwA0
AFMAbwBIAEkAdgBsAHcAZAA1AEMAZQBhAE8AbABkAGIARwBsAHYAbABTAFUAKwBWAFMANgB0AE0A
UAByAG4AZABSAE8AegB2AC8ARwBLAHcASQBmAGwAMgBQAFAAQwBvAEoALwBRAFkAYwBhAE8ATAB4
AFQANwBDAG4AYQBvAHcALwAzAG0ASwArAEcAMQBZAE8ARQBGAFoAVgByAG4AbgBMACsAYQB2AGIA
RABkAHoAMgBQAGkAZQB1AEkAbQBsAEUAcwBkAFIAQgBmAEQAKwBvAFgAOABhADEASwBjADMAbgBq
AG0ASABCAHAAYwB6AGcARgBuAGoATgBlAG0AeQA3AFQAQwBJAG4AMgBiAGsASQBOAEwAOQBnADgA
VQBSAHgAVwAvAC8AQQBNAFEAMQBhAFUAZgBEAGQAYgBmAFYAVwBzAE0AKwBEAGQAWABYAEsAQgBK
AFcAbQB3AEgAOQBSAGwAbABYADEAMQBDAHkAQgBvAGsAagBoAEQATgBoADQAdABKAEgAWgBFAGoA
UwBTAFMAegBmAHoAQwBWAGMAQgByAGcAbwBrAGQAVABDAHkARgBZAD0AAAAAAIKI

--_000_DM5PR12MB17706C1E60B13D31E304B9C5B00D9DM5PR12MB1770namp_--
