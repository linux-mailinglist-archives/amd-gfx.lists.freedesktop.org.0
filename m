Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14494ED218
	for <lists+amd-gfx@lfdr.de>; Thu, 31 Mar 2022 06:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742B710F546;
	Thu, 31 Mar 2022 04:12:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DBA10F545
 for <amd-gfx@lists.freedesktop.org>; Thu, 31 Mar 2022 04:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP2Kx+Q+bGsbc5T/sIIcQZ+CcXbwH4aKS6DLUo433ho+sIZ22502Yrdt1av8Jy+jRh+g0a0Wi9+yniBCp5uBR6CYj8EFKYrOsoKUg8HupVy63vT6aWfKnUrAuqUhy8C6HfqpbWpfgYBsJro/SkDbp7ZRLa2Xb372JxSb5Bt4i/TaxV1HXjSH2uJKEhEV7TEtHpNHZ5z9/is/llEcPwtE9VpWaR+Yuu8De53BhrkNQ7Nk6cxJPBeMyB+6WNXu5Bzk/Cece0B7Vk1ISzVRyOciDm0olO1pdeF15DiXlOTO6ExG1IIVcHEtAPxjYi1jhdOj/L0HQbNUBFN+B8B+Xiu0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcf8CHxJmm5jYtW/K9ODl4ZkGNMiScgwKqt+Xad/FCs=;
 b=LM3XZUfgK3B58IqroimExryMQvNzzTMy2Xi+dkdPaiQZyVRB7L0kIsK2NJXHiGku0HGJkpM7AV4GNyN11DoMGMlmmPnd0Wzf6WcZCs2UbVoH3iV/Bop9VehLhlNDXv34f8INiIClIe2Gcb1mgnHBi71Rra93W5VqzV1Ecjo/yklZ8CeV9Xji+Pn73Py3ZiQOAmEXSErraCAifzZCdgcSFJcH/5Nveu5hFO6OqiKajqOhphh+9RF9juAFKSuQN2nbTWMYyGqUh/o2bdL8ROjr40goPR+7cZLjoKGwQ+Wz8kfKLaVlFkZ0JhCW0Ol1GX9/VQQjG652vF/rjUm+yDajCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcf8CHxJmm5jYtW/K9ODl4ZkGNMiScgwKqt+Xad/FCs=;
 b=OnNUpK9Au+WdjRxGF4z8mj8vaJS3NzwtKLOlEUfcdAn7EWWJW7D3y6u2JydO+R9fMptNkLpLyBr6nX8NZ0eJPFd5WbDH+xUlk/x+fbh5A/bYeAKZCpiJFWcX0hWewrCDRGDIW/7YJ/VY3vQU9dmMRCPHF0Gh1VfdZ8wsgu5KftI=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by BL1PR12MB5303.namprd12.prod.outlook.com (2603:10b6:208:317::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 04:12:31 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c1c8:b797:3144:571d]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c1c8:b797:3144:571d%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 04:12:31 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: expand cg_flags from u32 to u64
Thread-Topic: [PATCH] drm/amdgpu: expand cg_flags from u32 to u64
Thread-Index: AQHYRLAraO+rVWf2uEmC5x29JWIeQ6zY4ZXw
Date: Thu, 31 Mar 2022 04:12:31 +0000
Message-ID: <BN9PR12MB5257ED0190F7E357C72119FFFCE19@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20220331033303.2843762-1-evan.quan@amd.com>
In-Reply-To: <20220331033303.2843762-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=3428f170-83e3-4c30-b8bc-806ab6cea62c;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-31T04:12:04Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3db1f6fa-1d5d-47bd-43b0-08da12ccad32
x-ms-traffictypediagnostic: BL1PR12MB5303:EE_
x-microsoft-antispam-prvs: <BL1PR12MB53036C3BF046485702A81E83FCE19@BL1PR12MB5303.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e72QyDtrcJeqshjvsRoN01gQpQ1+FEfngZnnPSSX0ps/mk4aNz27xM/N9o9c0r8gj07vtZYmT3uRxEzgUOzhF8AyjjBIqqSd++ju6evwECrxE73VoWbDFLBCWx8/1JvEcfYcx3Npz56f81FOWcpb0zC0QvqT7TrUCJK2nRz9lrmNU2P0WLsWtFchldEyggfDfBAZRPgC9jGGlDl3ccN/1fHhG+rYJcSSp30+iIiAk9djCHnDN26dEa+cajHSExwelROLQpTMS9RyvrsrBWDbl/AUCWjZQ0KLolLfBBY4ouBomzUAQCkqceLChBWVYwygcsmtbg/FL6/12jYj0dQvWvV2TUhM7tslvZ6ASXLk4qwPyGgx7cyAZzhL5jZbjfoTcB0ZuSZC1tjXOz3nmYO3Rqj6sXFvmYLF5SRxiIuI83Zm74GVCjyzdYLpYyNbiCCRiwhKI2LxOfFp9GwUsayUFbmQACETvtf9xK4/eUFVsbq3EozWofFGT133Ctkjt/O3X+N5jEd4V7p3BS8OFYrJ9+W6nzi27dSOdTSpLBgmZQ5qrcOVwViy7HKFZzL7ug6QxiqbLcohj28trn+HIx5xenBVVwWVDDbRCwEiy8tHQQtMfPTxT95SUey4EbduW8LjSLggcfNRVLqdwX7dG9R3osfP0kQPJMq4iAQsvRXouPKVjpThMMkAfP0tsEdFoxDY//TNJ8kEiF0hys+T8ENjWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(55016003)(66556008)(71200400001)(8676002)(4326008)(64756008)(66446008)(186003)(76116006)(122000001)(86362001)(66946007)(33656002)(26005)(38100700002)(52536014)(8936002)(316002)(6506007)(110136005)(5660300002)(83380400001)(38070700005)(30864003)(54906003)(2906002)(508600001)(53546011)(7696005)(9686003)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4eJtOKEblsNRun58BDkxoz6GEj0wodT8IDfZZcD13UdK96AzltAa4rfp4hih?=
 =?us-ascii?Q?BzACjh0ejTWYM24s8wxwLN0NqoOVrTwNj7+E4B6z4sOy0eFnPq4G+wMbWgPQ?=
 =?us-ascii?Q?ndHyRwKWCCapLWv6a/iib9ErSkXl7PLfKfJ51u8GGE7AUC629P5lOhBe1q8q?=
 =?us-ascii?Q?8BboR7FXbCksEAx6/btwqdfRu50Kc2g8k4cPDVgFsLJpjQrWW5aCPx/6E/uQ?=
 =?us-ascii?Q?LcyXfrWiomfHRkndHcexFeCxx504R04JDtFy6SiBvHml9pPGf248L/PI4yX9?=
 =?us-ascii?Q?v5fEtd4dK8aipviu7cBwbxSV8S4C+rRKCJjlr3mi56CSpFESaPAOF3yC26tT?=
 =?us-ascii?Q?76Yo7rBicuLQPC7UlqT38ym6jPc2F6RsErpJ4bGQ9mn/4H6lJwH0D+coykad?=
 =?us-ascii?Q?HxUDODIVbJZ0l6beaVojFJio+/DDqIUYQSKMTOQzjaknPIJ3UFHI1Nhvzh3I?=
 =?us-ascii?Q?7WVoXUD+jLcfeN1vE1PO7kvBxdvRza+U8EM/BLuRUchWi1fkZsmxsEzBVGXu?=
 =?us-ascii?Q?xFBMpokT+5GLybAUtKnjtMTl6Es+h4sc7Q437/DR9+NHq+U0MSI0GNR/rpw5?=
 =?us-ascii?Q?qQ6ApUseiYxqMCkVibYWIgUh9A55+e3jkPzwQ28AkxW4D9Lbx/Ekj38u/WQQ?=
 =?us-ascii?Q?4M3tZMslMAvNCzg573SO324mO91+OXZ7xB4LtBXUbBgCFaF30PJHyZ5HVoe6?=
 =?us-ascii?Q?89x3vdt50gb4z9+Rj8mTrYezhQfmB2paWq5hsgr86MDWo2z5VL/ewkEdPcac?=
 =?us-ascii?Q?Ghyrr3oV6SMUcrBfDgScRHWVvOQzftg1VkwQyWVh7HgI4SsZGa5pww2QtVyo?=
 =?us-ascii?Q?L+VV4antEApqOfUHBPsdtDfd/repdhl56LOBxSj6H009wlUW/yADCbUOilr+?=
 =?us-ascii?Q?8pu8+04dp9XITQ9uyr3zrCC7mJ1BbPyIrm/q83L9dT70Zyw5gfPeEHLtEFXp?=
 =?us-ascii?Q?cJSFwqL5CEG1HNil7x/6WxWrRV0NaNvrI5eh72Z4oK+tRCqpDCPMdcKmyolQ?=
 =?us-ascii?Q?nxUTPBkjybAgiQGB8lrsyWtwEbMuTtFQ/j8uuMcF+RvffXtgIUZvQcsQCzu+?=
 =?us-ascii?Q?r8cpq+T4YEFFti3aYMk4LhygpcAzJP9LEEYtZJxLEhjXQEa1jLK9j6MMSKya?=
 =?us-ascii?Q?utqqyN1yvrTWRbQoAsh0fk+cI4LZ5B0ERHkbQq/LHIZEVwOYHB/49D3DzhfJ?=
 =?us-ascii?Q?p5EQ1UwKmKWYmI4w75AtfTXAdFyUsZM990+Na2Ac1LTnVe5TubuEHtyyPMH7?=
 =?us-ascii?Q?l+4xkk3Q3vVRINxsqXc6J7tZwNMiRPVbxnr6VxLFFk7u8fulTJZeWSLEEmrS?=
 =?us-ascii?Q?CmveHM8tBq8c9xS5t4ABfk4ZlP8xg+9iiSGtbsuvNRgEwZP9aTW1ZJ6NnvD8?=
 =?us-ascii?Q?JXsqCtTo7QVhaEXfhpLR/jswmaWGfuYJScz+cKJ3LDdlCMnqNwrt44cInyBf?=
 =?us-ascii?Q?LLFsaq7fBVCIL1Qiky6bGduE0aAlOsixMOpxIHVQTGSoWqApc2BWsHCjRnb7?=
 =?us-ascii?Q?73/g34li6OEyr2X7r16y6ERzn2+Yh9l8ljbOQ4yBcyCQeEkzuW8AUe4ATTFs?=
 =?us-ascii?Q?ssLun6Vz9ZNxzo+710bUVe1sk7EXRMFf19wV1Hy7U7vpfNb7HHOiu+OXYikd?=
 =?us-ascii?Q?AL4NPXEYEqSc7V8e3ZthVkTsiKi20a0TAwWuiIGvgyzTNDv3F6mywN84jp7F?=
 =?us-ascii?Q?NEJYWTGXBc/06zfdsO2xFkR9norTy1Ih6+ylRuVvreBCCAVJo+QIIbUWCI1Z?=
 =?us-ascii?Q?w8gtBvWVVA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db1f6fa-1d5d-47bd-43b0-08da12ccad32
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 04:12:31.3321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZ6HXy7A4xDOF4MAxHoaxNN/SP/BDfo0jULWVwTMmQ7z9fNSC7cX5pgIPgQjHEsT6y0STbRUiiKZkIDKq0Zy+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5303
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "StDenis,
 Tom" <Tom.StDenis@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Evan Qua=
n
Sent: Thursday, March 31, 2022 11:33
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; StDenis, Tom <Tom.StDen=
is@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amdgpu: expand cg_flags from u32 to u64

With this, we can support more CG flags.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Change-Id: Iccf13c2f9c570ca6a4654291fc4876556125c3b8
--
v1->v2:
  - amdgpu_debugfs_gca_config_read: add a new rev to
    support CG flag upper 32 bits(Alex)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  5 +-  drivers/gpu/drm/amd/a=
mdgpu/amdgpu_device.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c             |  2 +-
 drivers/gpu/drm/amd/include/amd_shared.h    | 66 ++++++++++-----------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c          |  4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h      |  2 +-
 53 files changed, 94 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 22eeddd01014..dfc5b46c6a11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -179,7 +179,7 @@ extern int amdgpu_sched_jobs;  extern int amdgpu_sched_=
hw_submission;  extern uint amdgpu_pcie_gen_cap;  extern uint amdgpu_pcie_l=
ane_cap; -extern uint amdgpu_cg_mask;
+extern u64 amdgpu_cg_mask;
 extern uint amdgpu_pg_mask;
 extern uint amdgpu_sdma_phase_quantum;
 extern char *amdgpu_disable_cu;
@@ -322,7 +322,7 @@ int amdgpu_device_ip_set_powergating_state(void *dev,
                                           enum amd_ip_block_type block_typ=
e,
                                           enum amd_powergating_state state=
);  void amdgpu_device_ip_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags);
+                                           u64 *flags);
 int amdgpu_device_ip_wait_for_idle(struct amdgpu_device *adev,
                                   enum amd_ip_block_type block_type);  boo=
l amdgpu_device_ip_is_idle(struct amdgpu_device *adev, @@ -860,7 +860,7 @@ =
struct amdgpu_device {
        /* powerplay */
        struct amd_powerplay            powerplay;
        struct amdgpu_pm                pm;
-       u32                             cg_flags;
+       u64                             cg_flags;
        u32                             pg_flags;

        /* nbio */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.c
index 5d04d24a0d5f..1db48dc58ae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -758,7 +758,7 @@ static ssize_t amdgpu_debugfs_gca_config_read(struct fi=
le *f, char __user *buf,
        /* rev=3D=3D1 */
        config[no_regs++] =3D adev->rev_id;
        config[no_regs++] =3D adev->pg_flags;
-       config[no_regs++] =3D adev->cg_flags;
+       config[no_regs++] =3D lower_32_bits(adev->cg_flags);

        /* rev=3D=3D2 */
        config[no_regs++] =3D adev->family;
@@ -773,6 +773,9 @@ static ssize_t amdgpu_debugfs_gca_config_read(struct fi=
le *f, char __user *buf,
        /* rev=3D=3D4 APU flag */
        config[no_regs++] =3D adev->flags & AMD_IS_APU ? 1 : 0;

+       /* rev=3D=3D5 CG flag upper 32bit */
+       config[no_regs++] =3D upper_32_bits(adev->cg_flags);
+
        while (size && (*pos < no_regs * 4)) {
                uint32_t value;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index fa4a9f13c922..6f47726f1765 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1703,7 +1703,7 @@ int amdgpu_device_ip_set_powergating_state(void *dev,
  * clockgating is enabled.
  */
 void amdgpu_device_ip_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int i;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_df.h
index 6b25837955c4..1538b2dbfff1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h
@@ -40,7 +40,7 @@ struct amdgpu_df_funcs {
        void (*update_medium_grain_clock_gating)(struct amdgpu_device *adev=
,
                                                 bool enable);
        void (*get_clockgating_state)(struct amdgpu_device *adev,
-                                     u32 *flags);
+                                     u64 *flags);
        void (*enable_ecc_force_par_wr_rmw)(struct amdgpu_device *adev,
                                            bool enable);
        int (*pmc_start)(struct amdgpu_device *adev, uint64_t config, diff =
--git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgp=
u/amdgpu_drv.c
index bda1b5132ee8..e98820465109 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -136,7 +136,7 @@ int amdgpu_sched_jobs =3D 32;  int amdgpu_sched_hw_subm=
ission =3D 2;  uint amdgpu_pcie_gen_cap;  uint amdgpu_pcie_lane_cap; -uint =
amdgpu_cg_mask =3D 0xffffffff;
+u64 amdgpu_cg_mask =3D 0xffffffffffffffff;
 uint amdgpu_pg_mask =3D 0xffffffff;
 uint amdgpu_sdma_phase_quantum =3D 32;
 char *amdgpu_disable_cu =3D NULL;
@@ -454,12 +454,12 @@ MODULE_PARM_DESC(pcie_lane_cap, "PCIE Lane Caps (0: a=
utodetect (default))");  module_param_named(pcie_lane_cap, amdgpu_pcie_lane=
_cap, uint, 0444);

 /**
- * DOC: cg_mask (uint)
+ * DOC: cg_mask (ullong)
  * Override Clockgating features enabled on GPU (0 =3D disable clock gatin=
g). See the AMD_CG_SUPPORT flags in
- * drivers/gpu/drm/amd/include/amd_shared.h. The default is 0xffffffff (al=
l enabled).
+ * drivers/gpu/drm/amd/include/amd_shared.h. The default is 0xffffffffffff=
ffff (all enabled).
  */
 MODULE_PARM_DESC(cg_mask, "Clockgating flags mask (0 =3D disable clock gat=
ing)"); -module_param_named(cg_mask, amdgpu_cg_mask, uint, 0444);
+module_param_named(cg_mask, amdgpu_cg_mask, ullong, 0444);

 /**
  * DOC: pg_mask (uint)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_hdp.h
index 9181c7bef7c6..ac5c61d3de2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
@@ -33,7 +33,7 @@ struct amdgpu_hdp_funcs {
        void (*invalidate_hdp)(struct amdgpu_device *adev,
                               struct amdgpu_ring *ring);
        void (*update_clock_gating)(struct amdgpu_device *adev, bool enable=
);
-       void (*get_clock_gating_state)(struct amdgpu_device *adev, u32 *fla=
gs);
+       void (*get_clock_gating_state)(struct amdgpu_device *adev, u64
+*flags);
        void (*init_registers)(struct amdgpu_device *adev);  };

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mmhub.h
index 9f1540f0ebf9..f939395c5914 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h
@@ -34,7 +34,7 @@ struct amdgpu_mmhub_funcs {
        void (*gart_disable)(struct amdgpu_device *adev);
        int (*set_clockgating)(struct amdgpu_device *adev,
                               enum amd_clockgating_state state);
-       void (*get_clockgating)(struct amdgpu_device *adev, u32 *flags);
+       void (*get_clockgating)(struct amdgpu_device *adev, u64 *flags);
        void (*setup_vm_pt_regs)(struct amdgpu_device *adev, uint32_t vmid,
                                uint64_t page_table_base);
        void (*update_power_gating)(struct amdgpu_device *adev, diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h b/drivers/gpu/drm/amd/amdgpu/amd=
gpu_nbio.h
index 3d13e601fc35..03439083182a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h
@@ -83,7 +83,7 @@ struct amdgpu_nbio_funcs {
        void (*update_medium_grain_light_sleep)(struct amdgpu_device *adev,
                                                bool enable);
        void (*get_clockgating_state)(struct amdgpu_device *adev,
-                                     u32 *flags);
+                                     u64 *flags);
        void (*ih_control)(struct amdgpu_device *adev);
        void (*init_registers)(struct amdgpu_device *adev);
        void (*remap_hdp_registers)(struct amdgpu_device *adev); diff --git=
 a/drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h b/drivers/gpu/drm/amd/amdgpu/a=
mdgpu_smuio.h
index 484bb3dcec47..c7a823f3f2c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h
@@ -27,7 +27,7 @@ struct amdgpu_smuio_funcs {
        u32 (*get_rom_index_offset)(struct amdgpu_device *adev);
        u32 (*get_rom_data_offset)(struct amdgpu_device *adev);
        void (*update_rom_clock_gating)(struct amdgpu_device *adev, bool en=
able);
-       void (*get_clock_gating_state)(struct amdgpu_device *adev, u32 *fla=
gs);
+       void (*get_clock_gating_state)(struct amdgpu_device *adev, u64
+*flags);
        u32 (*get_die_id)(struct amdgpu_device *adev);
        u32 (*get_socket_id)(struct amdgpu_device *adev);
        bool (*is_host_gpu_xgmi_supported)(struct amdgpu_device *adev); dif=
f --git a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c b/drivers/gpu/drm/amd/amd=
gpu/athub_v1_0.c
index 88642e7ecdf4..a13c443ea10f 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
@@ -87,7 +87,7 @@ int athub_v1_0_set_clockgating(struct amdgpu_device *adev=
,
        return 0;
 }

-void athub_v1_0_get_clockgating(struct amdgpu_device *adev, u32 *flags)
+void athub_v1_0_get_clockgating(struct amdgpu_device *adev, u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.h b/drivers/gpu/drm/amd/=
amdgpu/athub_v1_0.h
index b279af59e34f..6be0a6704ea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.h
@@ -25,6 +25,6 @@

 int athub_v1_0_set_clockgating(struct amdgpu_device *adev,
                               enum amd_clockgating_state state); -void ath=
ub_v1_0_get_clockgating(struct amdgpu_device *adev, u32 *flags);
+void athub_v1_0_get_clockgating(struct amdgpu_device *adev, u64
+*flags);

 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c b/drivers/gpu/drm/amd/=
amdgpu/athub_v2_0.c
index a720436857b4..a9521c98e7f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
@@ -93,7 +93,7 @@ int athub_v2_0_set_clockgating(struct amdgpu_device *adev=
,
        return 0;
 }

-void athub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *flags)
+void athub_v2_0_get_clockgating(struct amdgpu_device *adev, u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.h b/drivers/gpu/drm/amd/=
amdgpu/athub_v2_0.h
index 02932c1c8bab..8b763f6dfd81 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.h
@@ -25,6 +25,6 @@

 int athub_v2_0_set_clockgating(struct amdgpu_device *adev,
                               enum amd_clockgating_state state); -void ath=
ub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *flags);
+void athub_v2_0_get_clockgating(struct amdgpu_device *adev, u64
+*flags);

 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c b/drivers/gpu/drm/amd/=
amdgpu/athub_v2_1.c
index ad8e87d3d2cb..78508ae6a670 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
@@ -85,7 +85,7 @@ int athub_v2_1_set_clockgating(struct amdgpu_device *adev=
,
        return 0;
 }

-void athub_v2_1_get_clockgating(struct amdgpu_device *adev, u32 *flags)
+void athub_v2_1_get_clockgating(struct amdgpu_device *adev, u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.h b/drivers/gpu/drm/amd/=
amdgpu/athub_v2_1.h
index 5e6824c0f591..b799f14bce03 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.h
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.h
@@ -25,6 +25,6 @@

 int athub_v2_1_set_clockgating(struct amdgpu_device *adev,
                               enum amd_clockgating_state state); -void ath=
ub_v2_1_get_clockgating(struct amdgpu_device *adev, u32 *flags);
+void athub_v2_1_get_clockgating(struct amdgpu_device *adev, u64
+*flags);

 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c b/drivers/gpu/drm/amd/amd=
gpu/df_v1_7.c
index 2d01ac0d4c11..b991609f46c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
@@ -99,7 +99,7 @@ static void df_v1_7_update_medium_grain_clock_gating(stru=
ct amdgpu_device *adev,  }

 static void df_v1_7_get_clockgating_state(struct amdgpu_device *adev,
-                                         u32 *flags)
+                                         u64 *flags)
 {
        u32 tmp;

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amd=
gpu/df_v3_6.c
index f4dfca013ec5..483a441b46aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -332,7 +332,7 @@ static void df_v3_6_update_medium_grain_clock_gating(st=
ruct amdgpu_device *adev,  }

 static void df_v3_6_get_clockgating_state(struct amdgpu_device *adev,
-                                         u32 *flags)
+                                         u64 *flags)
 {
        u32 tmp;

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index a98b78e0b507..de1bbbd4238c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -8451,7 +8451,7 @@ static int gfx_v10_0_set_clockgating_state(void *hand=
le,
        return 0;
 }

-static void gfx_v10_0_get_clockgating_state(void *handle, u32 *flags)
+static void gfx_v10_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v8_0.c
index 5f112efda634..46d436be74eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -5475,7 +5475,7 @@ static int gfx_v8_0_set_powergating_state(void *handl=
e,
        return 0;
 }

-static void gfx_v8_0_get_clockgating_state(void *handle, u32 *flags)
+static void gfx_v8_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c
index 46d4bf27ebbb..f9709d7a1391 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5231,7 +5231,7 @@ static int gfx_v9_0_set_clockgating_state(void *handl=
e,
        return 0;
 }

-static void gfx_v9_0_get_clockgating_state(void *handle, u32 *flags)
+static void gfx_v9_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c
index 5228421b0f72..a455e59f41f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1161,7 +1161,7 @@ static int gmc_v10_0_set_clockgating_state(void *hand=
le,
                return athub_v2_0_set_clockgating(adev, state);  }

-static void gmc_v10_0_get_clockgating_state(void *handle, u32 *flags)
+static void gmc_v10_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v8_0.c
index 1932a3e4af7e..382dde1ce74c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1690,7 +1690,7 @@ static int gmc_v8_0_set_powergating_state(void *handl=
e,
        return 0;
 }

-static void gmc_v8_0_get_clockgating_state(void *handle, u32 *flags)
+static void gmc_v8_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index 6009fbfdcc19..22761a3bb818 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1948,7 +1948,7 @@ static int gmc_v9_0_set_clockgating_state(void *handl=
e,
        return 0;
 }

-static void gmc_v9_0_get_clockgating_state(void *handle, u32 *flags)
+static void gmc_v9_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/hdp_v4_0.c
index 046216635262..adf89680f53e 100644
--- a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
@@ -124,7 +124,7 @@ static void hdp_v4_0_update_clock_gating(struct amdgpu_=
device *adev,  }

 static void hdp_v4_0_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c b/drivers/gpu/drm/amd/am=
dgpu/hdp_v5_0.c
index 5793977953cc..a9ea23fa0def 100644
--- a/drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c
@@ -181,7 +181,7 @@ static void hdp_v5_0_update_clock_gating(struct amdgpu_=
device *adev,  }

 static void hdp_v5_0_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        uint32_t tmp;

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v1_0.c
index 4c9f0c0f3116..3f44a099c52a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
@@ -546,7 +546,7 @@ static int mmhub_v1_0_set_clockgating(struct amdgpu_dev=
ice *adev,
        return 0;
 }

-static void mmhub_v1_0_get_clockgating(struct amdgpu_device *adev, u32 *fl=
ags)
+static void mmhub_v1_0_get_clockgating(struct amdgpu_device *adev, u64
+*flags)
 {
        int data, data1;

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v1_7.c
index 3b901f941627..6fa7090bc6cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -542,7 +542,7 @@ static int mmhub_v1_7_set_clockgating(struct amdgpu_dev=
ice *adev,
        return 0;
 }

-static void mmhub_v1_7_get_clockgating(struct amdgpu_device *adev, u32 *fl=
ags)
+static void mmhub_v1_7_get_clockgating(struct amdgpu_device *adev, u64
+*flags)
 {
        int data, data1;

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_0.c
index 3718ff610ab2..636abd855686 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -682,7 +682,7 @@ static int mmhub_v2_0_set_clockgating(struct amdgpu_dev=
ice *adev,
        return 0;
 }

-static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *fl=
ags)
+static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u64
+*flags)
 {
        int data, data1;

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_3.c
index 1957fb098c4d..ff44c5364a8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -577,7 +577,7 @@ static int mmhub_v2_3_set_clockgating(struct amdgpu_dev=
ice *adev,
        return 0;
 }

-static void mmhub_v2_3_get_clockgating(struct amdgpu_device *adev, u32 *fl=
ags)
+static void mmhub_v2_3_get_clockgating(struct amdgpu_device *adev, u64
+*flags)
 {
        int data, data1, data2, data3;

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.c
index 619106f7d23d..6e0145b2b408 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -647,7 +647,7 @@ static int mmhub_v9_4_set_clockgating(struct amdgpu_dev=
ice *adev,
        return 0;
 }

-static void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *fl=
ags)
+static void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u64
+*flags)
 {
        int data, data1;

diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/navi10_ih.c
index 8ce5b8ca1fd7..97201ab0965e 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -685,7 +685,7 @@ static int navi10_ih_set_powergating_state(void *handle=
,
        return 0;
 }

-static void navi10_ih_get_clockgating_state(void *handle, u32 *flags)
+static void navi10_ih_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v2_3.c
index ee7cab37dfd5..6cd1fb2eb913 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -278,7 +278,7 @@ static void nbio_v2_3_update_medium_grain_light_sleep(s=
truct amdgpu_device *adev  }

 static void nbio_v2_3_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v6_1.c
index 4bbacf1be25a..f7f6ddebd3e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
@@ -210,7 +210,7 @@ static void nbio_v6_1_update_medium_grain_light_sleep(s=
truct amdgpu_device *adev  }

 static void nbio_v6_1_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v7_0.c
index 37a4039fdfc5..aa0326d00c72 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
@@ -205,7 +205,7 @@ static void nbio_v7_0_update_medium_grain_light_sleep(s=
truct amdgpu_device *adev  }

 static void nbio_v7_0_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v7_2.c
index 6f81de6f3cc4..31776b12e4c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
@@ -306,7 +306,7 @@ static void nbio_v7_2_update_medium_grain_light_sleep(s=
truct amdgpu_device *adev  }

 static void nbio_v7_2_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v7_4.c
index c2357e83a8c4..4531761dcf77 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -273,7 +273,7 @@ static void nbio_v7_4_update_medium_grain_light_sleep(s=
truct amdgpu_device *adev  }

 static void nbio_v7_4_get_clockgating_state(struct amdgpu_device *adev,
-                                           u32 *flags)
+                                           u64 *flags)
 {
        int data;

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/n=
v.c index e19f14c3ef59..0a7946c59a42 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1115,7 +1115,7 @@ static int nv_common_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void nv_common_get_clockgating_state(void *handle, u32 *flags)
+static void nv_common_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v3_0.c
index 4ef4feff5649..3695374896ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1535,7 +1535,7 @@ static int sdma_v3_0_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void sdma_v3_0_get_clockgating_state(void *handle, u32 *flags)
+static void sdma_v3_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v4_0.c
index d7e8f7232364..8589ab1c9800 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2372,7 +2372,7 @@ static int sdma_v4_0_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void sdma_v4_0_get_clockgating_state(void *handle, u32 *flags)
+static void sdma_v4_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_0.c
index a8d49c005f73..775aabde1ae2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1648,7 +1648,7 @@ static int sdma_v5_0_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void sdma_v5_0_get_clockgating_state(void *handle, u32 *flags)
+static void sdma_v5_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_2.c
index 824eace69884..ca50857b982d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1645,7 +1645,7 @@ static int sdma_v5_2_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void sdma_v5_2_get_clockgating_state(void *handle, u32 *flags)
+static void sdma_v5_2_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/smuio_v11_0.c
index b6f1322f908c..acdc40f99ab3 100644
--- a/drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c
@@ -59,7 +59,7 @@ static void smuio_v11_0_update_rom_clock_gating(struct am=
dgpu_device *adev, bool
                WREG32_SOC15(SMUIO, 0, mmCGTT_ROM_CLK_CTRL0, data);  }

-static void smuio_v11_0_get_clock_gating_state(struct amdgpu_device *adev,=
 u32 *flags)
+static void smuio_v11_0_get_clock_gating_state(struct amdgpu_device
+*adev, u64 *flags)
 {
        u32 data;

diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c b/drivers/gpu/drm/a=
md/amdgpu/smuio_v11_0_6.c
index 3a18dbb55c32..2afeb8b37f62 100644
--- a/drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c
@@ -56,7 +56,7 @@ static void smuio_v11_0_6_update_rom_clock_gating(struct =
amdgpu_device *adev, bo
                WREG32_SOC15(SMUIO, 0, mmCGTT_ROM_CLK_CTRL0, data);  }

-static void smuio_v11_0_6_get_clock_gating_state(struct amdgpu_device *ade=
v, u32 *flags)
+static void smuio_v11_0_6_get_clock_gating_state(struct amdgpu_device
+*adev, u64 *flags)
 {
        u32 data;

diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c b/drivers/gpu/drm/amd=
/amdgpu/smuio_v13_0.c
index 39b7c206770f..13e905c22592 100644
--- a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
@@ -58,7 +58,7 @@ static void smuio_v13_0_update_rom_clock_gating(struct am=
dgpu_device *adev, bool
                WREG32_SOC15(SMUIO, 0, regCGTT_ROM_CLK_CTRL0, data);  }

-static void smuio_v13_0_get_clock_gating_state(struct amdgpu_device *adev,=
 u32 *flags)
+static void smuio_v13_0_get_clock_gating_state(struct amdgpu_device
+*adev, u64 *flags)
 {
        u32 data;

diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/smuio_v9_0.c
index 8417890af227..e4e30b9d481b 100644
--- a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
@@ -56,7 +56,7 @@ static void smuio_v9_0_update_rom_clock_gating(struct amd=
gpu_device *adev, bool
                WREG32_SOC15(SMUIO, 0, mmCGTT_ROM_CLK_CTRL0, data);  }

-static void smuio_v9_0_get_clock_gating_state(struct amdgpu_device *adev, =
u32 *flags)
+static void smuio_v9_0_get_clock_gating_state(struct amdgpu_device
+*adev, u64 *flags)
 {
        u32 data;

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 3d0251ef8d79..3ee7322081d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1419,7 +1419,7 @@ static int soc15_common_set_clockgating_state(void *h=
andle,
        return 0;
 }

-static void soc15_common_get_clockgating_state(void *handle, u32 *flags)
+static void soc15_common_get_clockgating_state(void *handle, u64
+*flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/am=
dgpu/uvd_v5_0.c
index 563493d1f830..d7e31e48a2b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -833,7 +833,7 @@ static int uvd_v5_0_set_powergating_state(void *handle,
        return ret;
 }

-static void uvd_v5_0_get_clockgating_state(void *handle, u32 *flags)
+static void uvd_v5_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/am=
dgpu/uvd_v6_0.c
index 2d558c2f417d..375c440957dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1494,7 +1494,7 @@ static int uvd_v6_0_set_powergating_state(void *handl=
e,
        return ret;
 }

-static void uvd_v6_0_get_clockgating_state(void *handle, u32 *flags)
+static void uvd_v6_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/am=
dgpu/vce_v3_0.c
index 142e291983b4..8def62c83ffd 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -831,7 +831,7 @@ static int vce_v3_0_set_powergating_state(void *handle,
        return ret;
 }

-static void vce_v3_0_get_clockgating_state(void *handle, u32 *flags)
+static void vce_v3_0_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/v=
i.c index 039b90cdc3bc..c5b88d15a6df 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -2033,7 +2033,7 @@ static int vi_common_set_powergating_state(void *hand=
le,
        return 0;
 }

-static void vi_common_get_clockgating_state(void *handle, u32 *flags)
+static void vi_common_get_clockgating_state(void *handle, u64 *flags)
 {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
        int data;
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd=
/include/amd_shared.h
index fe4e585781bb..741dae17562a 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -116,38 +116,38 @@ enum amd_powergating_state {


 /* CG flags */
-#define AMD_CG_SUPPORT_GFX_MGCG                        (1 << 0)
-#define AMD_CG_SUPPORT_GFX_MGLS                        (1 << 1)
-#define AMD_CG_SUPPORT_GFX_CGCG                        (1 << 2)
-#define AMD_CG_SUPPORT_GFX_CGLS                        (1 << 3)
-#define AMD_CG_SUPPORT_GFX_CGTS                        (1 << 4)
-#define AMD_CG_SUPPORT_GFX_CGTS_LS             (1 << 5)
-#define AMD_CG_SUPPORT_GFX_CP_LS               (1 << 6)
-#define AMD_CG_SUPPORT_GFX_RLC_LS              (1 << 7)
-#define AMD_CG_SUPPORT_MC_LS                   (1 << 8)
-#define AMD_CG_SUPPORT_MC_MGCG                 (1 << 9)
-#define AMD_CG_SUPPORT_SDMA_LS                 (1 << 10)
-#define AMD_CG_SUPPORT_SDMA_MGCG               (1 << 11)
-#define AMD_CG_SUPPORT_BIF_LS                  (1 << 12)
-#define AMD_CG_SUPPORT_UVD_MGCG                        (1 << 13)
-#define AMD_CG_SUPPORT_VCE_MGCG                        (1 << 14)
-#define AMD_CG_SUPPORT_HDP_LS                  (1 << 15)
-#define AMD_CG_SUPPORT_HDP_MGCG                        (1 << 16)
-#define AMD_CG_SUPPORT_ROM_MGCG                        (1 << 17)
-#define AMD_CG_SUPPORT_DRM_LS                  (1 << 18)
-#define AMD_CG_SUPPORT_BIF_MGCG                        (1 << 19)
-#define AMD_CG_SUPPORT_GFX_3D_CGCG             (1 << 20)
-#define AMD_CG_SUPPORT_GFX_3D_CGLS             (1 << 21)
-#define AMD_CG_SUPPORT_DRM_MGCG                        (1 << 22)
-#define AMD_CG_SUPPORT_DF_MGCG                 (1 << 23)
-#define AMD_CG_SUPPORT_VCN_MGCG                        (1 << 24)
-#define AMD_CG_SUPPORT_HDP_DS                  (1 << 25)
-#define AMD_CG_SUPPORT_HDP_SD                  (1 << 26)
-#define AMD_CG_SUPPORT_IH_CG                   (1 << 27)
-#define AMD_CG_SUPPORT_ATHUB_LS                        (1 << 28)
-#define AMD_CG_SUPPORT_ATHUB_MGCG              (1 << 29)
-#define AMD_CG_SUPPORT_JPEG_MGCG               (1 << 30)
-#define AMD_CG_SUPPORT_GFX_FGCG                        (1 << 31)
+#define AMD_CG_SUPPORT_GFX_MGCG                        (1ULL << 0)
+#define AMD_CG_SUPPORT_GFX_MGLS                        (1ULL << 1)
+#define AMD_CG_SUPPORT_GFX_CGCG                        (1ULL << 2)
+#define AMD_CG_SUPPORT_GFX_CGLS                        (1ULL << 3)
+#define AMD_CG_SUPPORT_GFX_CGTS                        (1ULL << 4)
+#define AMD_CG_SUPPORT_GFX_CGTS_LS             (1ULL << 5)
+#define AMD_CG_SUPPORT_GFX_CP_LS               (1ULL << 6)
+#define AMD_CG_SUPPORT_GFX_RLC_LS              (1ULL << 7)
+#define AMD_CG_SUPPORT_MC_LS                   (1ULL << 8)
+#define AMD_CG_SUPPORT_MC_MGCG                 (1ULL << 9)
+#define AMD_CG_SUPPORT_SDMA_LS                 (1ULL << 10)
+#define AMD_CG_SUPPORT_SDMA_MGCG               (1ULL << 11)
+#define AMD_CG_SUPPORT_BIF_LS                  (1ULL << 12)
+#define AMD_CG_SUPPORT_UVD_MGCG                        (1ULL << 13)
+#define AMD_CG_SUPPORT_VCE_MGCG                        (1ULL << 14)
+#define AMD_CG_SUPPORT_HDP_LS                  (1ULL << 15)
+#define AMD_CG_SUPPORT_HDP_MGCG                        (1ULL << 16)
+#define AMD_CG_SUPPORT_ROM_MGCG                        (1ULL << 17)
+#define AMD_CG_SUPPORT_DRM_LS                  (1ULL << 18)
+#define AMD_CG_SUPPORT_BIF_MGCG                        (1ULL << 19)
+#define AMD_CG_SUPPORT_GFX_3D_CGCG             (1ULL << 20)
+#define AMD_CG_SUPPORT_GFX_3D_CGLS             (1ULL << 21)
+#define AMD_CG_SUPPORT_DRM_MGCG                        (1ULL << 22)
+#define AMD_CG_SUPPORT_DF_MGCG                 (1ULL << 23)
+#define AMD_CG_SUPPORT_VCN_MGCG                        (1ULL << 24)
+#define AMD_CG_SUPPORT_HDP_DS                  (1ULL << 25)
+#define AMD_CG_SUPPORT_HDP_SD                  (1ULL << 26)
+#define AMD_CG_SUPPORT_IH_CG                   (1ULL << 27)
+#define AMD_CG_SUPPORT_ATHUB_LS                        (1ULL << 28)
+#define AMD_CG_SUPPORT_ATHUB_MGCG              (1ULL << 29)
+#define AMD_CG_SUPPORT_JPEG_MGCG               (1ULL << 30)
+#define AMD_CG_SUPPORT_GFX_FGCG                        (1ULL << 31)
 /* PG flags */
 #define AMD_PG_SUPPORT_GFX_PG                  (1 << 0)
 #define AMD_PG_SUPPORT_GFX_SMG                 (1 << 1)
@@ -298,7 +298,7 @@ struct amd_ip_funcs {
                                     enum amd_clockgating_state state);
        int (*set_powergating_state)(void *handle,
                                     enum amd_powergating_state state);
-       void (*get_clockgating_state)(void *handle, u32 *flags);
+       void (*get_clockgating_state)(void *handle, u64 *flags);
 };


diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/am=
dgpu_pm.c
index 4a9aabc16fbc..027b0df013c6 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3524,7 +3524,7 @@ static int amdgpu_debugfs_pm_info_pp(struct seq_file =
*m, struct amdgpu_device *a
        return 0;
 }

-static void amdgpu_parse_cg_state(struct seq_file *m, u32 flags)
+static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
 {
        int i;

@@ -3537,7 +3537,7 @@ static int amdgpu_debugfs_pm_info_show(struct seq_fil=
e *m, void *unused)  {
        struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private;
        struct drm_device *dev =3D adev_to_drm(adev);
-       u32 flags =3D 0;
+       u64 flags =3D 0;
        int r;

        if (amdgpu_in_reset(adev))
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h b/drivers/gpu/drm/amd/p=
m/inc/amdgpu_pm.h
index a920515e2274..52045ad59bed 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
@@ -26,7 +26,7 @@

 struct cg_flag_name
 {
-       u32 flag;
+       u64 flag;
        const char *name;
 };

--
2.29.0

