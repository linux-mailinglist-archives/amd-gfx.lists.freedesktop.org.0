Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C67D9C3C
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 16:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EF910E9D5;
	Fri, 27 Oct 2023 14:55:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CD310E9D5
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 14:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGO3LL071slpM3pmoRyEt5I4po49dBFgTo1g2+KFbdPauSB8FriS7h9WnGJ4t1SsBN/PDhgZRSe48TypWP/yAQMDbeAjW5QgbMynPEtUgIdAL+IKYbDEc2t/Y/bubJ0qcJ+rVNJwIOnlN0Jkns2EJFbrJDy+xS/UXOCtzM53oERgeR9d0ooWh8jviXpzcXAGlBYD3pZOFOg/nur2A3oRF7sZ7QqvxXwK0wTIn42tiJIUeGZmkPyTLXZzC3cAuXtrxNu0BAyIHX3qUppIyMbH95J8mroyQar3pYIjlDxjhSa4kqz3lKLW9d/bIhFJtaDGJnaskn+lC2+Qj/OYUboZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TODmfhMLkyWA/FNEqMlwKztQI/E/Bhya05tk/p+IvG4=;
 b=WQY+LQ6dixqcAni3zRJO/gOk6Iv7G6HM7iPJ2gyaBjZkQBRftkv/dBjM4YwcUGV60q6pwAkODlCdEyNx+1WDsixvoZjVF6SsfqCGY8CdtJbpj0p4q70y03kKVH2kEq53QdytX+WK3dBRURVeC4XRLektx5AajhWsOZ7FZrLewNfQEGHIgaWDHQG+n5OWS1kpNe3kPNLZexTEz3RBTY88T8WaXKRhMDszqyM4PdRdb5SQ6A0gIjEcoVGZ0jwcguhkUriwbyGlUJfSRnSGINjF+C0bbEEc5lsPIp2Aqzb18GXcLsjpZx7d3DFcw/5BuHpGb4dNMb1kBNguHsBFrOvdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TODmfhMLkyWA/FNEqMlwKztQI/E/Bhya05tk/p+IvG4=;
 b=ww7AIpMHL8IGWvbnr4Zd9TkQghfr6Z5nFCdXpLiL2b/Ug91wgk/QkGH37WgWS1HO25mT0J/QEOoYlMRKBpauKln9oocQGfySkMFjnlc9Ddvmc2TiRAWnZCr5mbtX3ZDMn5BINbWIN9IcznUDie89hKxrmvkxTdylz3ploAR2F2U=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 14:55:03 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::f0fa:4908:b418:96d2]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::f0fa:4908:b418:96d2%6]) with mapi id 15.20.6933.019; Fri, 27 Oct 2023
 14:55:02 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: add RAS reset/query operations for XGMI
 v6_4
Thread-Topic: [PATCH 2/2] drm/amdgpu: add RAS reset/query operations for XGMI
 v6_4
Thread-Index: AQHaCMlv64DB4j4+l0+rNNDkIjj6R7BduWaw
Date: Fri, 27 Oct 2023 14:55:02 +0000
Message-ID: <BN9PR12MB5257FCB54C72A30B520C6061FCDCA@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20231027113254.20958-1-tao.zhou1@amd.com>
 <20231027113254.20958-2-tao.zhou1@amd.com>
In-Reply-To: <20231027113254.20958-2-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=90489783-c16c-4a32-a61d-09b6d09ffaf0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-27T14:54:29Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|MN2PR12MB4047:EE_
x-ms-office365-filtering-correlation-id: 11d156e5-b73c-4f38-3729-08dbd6fcb31a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4QhpuAvFLA4WJxyd00uysfNRxyDHV3ci56gy8Ml4VfZ7RXCTlD47dtINahDMSFbmCFH3vCSzykGXoz2KsZLQaF6dcG4ZZibkBi5CAlvGpxWDN80N9lmVWkbGWTmBieXZS3Shg2CNa1StkwvokudqVLsa0WG02Hj3AcTykI8k/0cWu8HqLM+sgxqDE81PMx0yoZFKk67x8PmiQQevWMmrRmfeMkNYU7IRFYLAHzzTw5aDg1ByK5SAb7AlznsAu7PqgXgNeoq4SzyMHwTXfQ0j33qVF2xEanEB1Ejt3XipLwCjctBr3Ks/QtS+JW3nFwV6N5DBXQ0KOg3JpBPS1KWpFe9SwAVVwCDxQEcEVPzyi5Sg1hl3NTIn8Qla5bGRvzunmKE2M3uTs7PSyjKEqWntJcFOltPuQK4MPE8wryBQqB8DUXDcqO7t+20rifv+29JLilXCkzXWnBvDKPK3BIHPlcctQrT2iCAW8jDhPuvlI6VFqgvaMVujh1W4Mh3LfcKthmZCBg5rTekhSkNEWEe42J8h5b0sg/qmV3Cut8+DtBSio9l1AJfyZtkK8Ywl+F5K13P7/+rOyfttSMJGiDIm56xZapJ5SX0Oaabg+EWVPQcFUjymjNtdWW6pKox898rH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(52536014)(55016003)(71200400001)(7696005)(6506007)(478600001)(122000001)(66476007)(9686003)(76116006)(66946007)(64756008)(53546011)(110136005)(33656002)(86362001)(66446008)(26005)(66556008)(8936002)(83380400001)(8676002)(38100700002)(41300700001)(4326008)(38070700009)(5660300002)(316002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RAWeByw8AgD53ijHR1cxzgRwqv/A+IXVVfT7XYiabfS3okwvJ34g2EbXR5Ka?=
 =?us-ascii?Q?ONMnZdU1L6amdmD1nhl+DkBI1o0k7MG8zhEQIdFoUsLo1AUMeJoXn2ApbCRr?=
 =?us-ascii?Q?VmH3eqSObKB3vgnur/aF4IA5EgG7gA3KZQgbL3O2Um0MoYwnrCOityMswYf+?=
 =?us-ascii?Q?bmlA1ONJg4uW8Y3BZdhvVnPAf0VEF3LPnxk4AomyyuybmhYNq9OWt60tU0jg?=
 =?us-ascii?Q?F15TkHdkZsTICUmpt2+bJcpxmyKmxk80AQs9PLQ05PmWSpyFoIp3Js+TFvZ2?=
 =?us-ascii?Q?1sdSuWl7ppl6I/EypOClH3T9dBJgtPnjASnWG1Uku9fvS3wAAXxV0WQnshvM?=
 =?us-ascii?Q?IQWQQqpXsERLJeDdpd3HStbARmwu1FQ19pbxjfRDjiAwWHF4lpH8qOwfrM+L?=
 =?us-ascii?Q?/oSb8boBozlrz1h8E1YN60k2pWjXJpEUHlM05gW0uBRGznTVkgYkFEVhHBcx?=
 =?us-ascii?Q?uPrzf4yz5jzer5qipRdlwZ8b+Uu08Y0ujH7osUbUI0trXbYqyFj9/gwb4tTH?=
 =?us-ascii?Q?Vao7z7V2vJSYmikjK3xKHF0vtgjn816/VYTNoB7bKK9pt5UM8XKTkA48n2Mt?=
 =?us-ascii?Q?jpsb9lza9YP4x63Fnc6nUMhs1iAZmoR/TkJF8BSTDZfHTk1oxYkopAcSIgxk?=
 =?us-ascii?Q?81UnB/tU2ZgaZ28fJ2o52Mt0Ms2h/HnC3wbNWn8y5GCVHeqRwmrGw1ZSSiym?=
 =?us-ascii?Q?yHoSvJkcxO91W9TMjQfat47irpgOfpoXI6StmyfRzQWyb5rL2Mi9CPA6L12b?=
 =?us-ascii?Q?jGkIQU/mtPuTK0t3p37YJgTcZGOe8rHSQS418sj3A5nooQcu2fTCnuMBdyCg?=
 =?us-ascii?Q?g3c8UXFbAGpmK519pXw3xtGI2UEzRSHR7setfKb+Bd4xbY3hGG/D/7/5KnpO?=
 =?us-ascii?Q?djy2DgOz8yNUfOi5HGC525cTxlz8XDuhMsio67DT8bs87D6CEIHA2q3BlMll?=
 =?us-ascii?Q?87o82IBYv1YBigynUsfOibgEY7d8jlFflmrLJsT8/MII5FuPlMZVhKrMF5HW?=
 =?us-ascii?Q?f6RieXAkceeeRXpu5L1432TyRSnz1oUL+qWBgBWWjekfMGC+8QrGrxGDj4hg?=
 =?us-ascii?Q?fftbjqhTBZl7PKSSlIp2s1+grHrICr4za46aU9BW/dJOHkAphM4i/O9p8yio?=
 =?us-ascii?Q?q0ikYpmiljgsSxddGEuuHryjXhm/dwsOrFKo1RmuDPtexXSF+q1hcgPTTfLR?=
 =?us-ascii?Q?hZnZ66z9E85oVZP+DeNcnExsiR2hURsljm8zph9EZMXhHCzdrYAGQAvXxUt8?=
 =?us-ascii?Q?gYnnkVpKnPL2SH23TIL54cgqLbA7v1BYHzDV46m+TWxwVyyhaC65Ejz+Upup?=
 =?us-ascii?Q?q5CzIZ+UJ1/QTEiUMHXmtyDFXBFppWEK6N/HGIN4UlYWJbTatuXPsD1oqXhn?=
 =?us-ascii?Q?o1PhM9Pyzt/AQGSGU7Bc2P1pDfIQKwckI4NdytbNXdy2Mth/B3Wl/QQ24c3/?=
 =?us-ascii?Q?9VudthjgR19tivYVTh+KU9OMpLVMkhZu/hi9AVcKMCilTkNstZgU4PhjjqxF?=
 =?us-ascii?Q?cLlq9oZSE4GqN1pwed2+qbdnseqViH22PXstsd/0rQf+Pblwke8LiTrLTlQY?=
 =?us-ascii?Q?RwUGwyKyvMgI97u+jOmt3OjUkWQ98TCBY0Dv9Ria?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d156e5-b73c-4f38-3729-08dbd6fcb31a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 14:55:02.7396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnNTyIz8PcR5SIWesh1JJTQe/l3mAUg8jUrvml7Ctlugnc0ESKkzq5RVZeqvYPk+EVMCzFWiA66pYF4JcWMLjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Series is

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tao Zhou
Sent: Friday, October 27, 2023 19:33
To: amd-gfx@lists.freedesktop.org
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: add RAS reset/query operations for XGMI v6=
_4

Reset/query RAS error status and count.

v2: use XGMI IP version instead of WAFL version.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 46 ++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.c
index 2b7dc490ba6b..0533f873001b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -103,6 +103,16 @@ static const int walf_pcs_err_noncorrectable_mask_reg_=
aldebaran[] =3D {
        smnPCS_GOPX1_PCS_ERROR_NONCORRECTABLE_MASK + 0x100000  };

+static const int xgmi3x16_pcs_err_status_reg_v6_4[] =3D {
+       smnPCS_XGMI3X16_PCS_ERROR_STATUS,
+       smnPCS_XGMI3X16_PCS_ERROR_STATUS + 0x100000 };
+
+static const int xgmi3x16_pcs_err_noncorrectable_mask_reg_v6_4[] =3D {
+       smnPCS_XGMI3X16_PCS_ERROR_NONCORRECTABLE_MASK,
+       smnPCS_XGMI3X16_PCS_ERROR_NONCORRECTABLE_MASK + 0x100000 };
+
 static const struct amdgpu_pcs_ras_field xgmi_pcs_ras_fields[] =3D {
        {"XGMI PCS DataLossErr",
         SOC15_REG_FIELD(XGMI0_PCS_GOPX16_PCS_ERROR_STATUS, DataLossErr)}, =
@@ -958,6 +968,16 @@ static void amdgpu_xgmi_reset_ras_error_count(struct a=
mdgpu_device *adev)
        default:
                break;
        }
+
+       switch (amdgpu_ip_version(adev, XGMI_HWIP, 0)) {
+       case IP_VERSION(6, 4, 0):
+               for (i =3D 0; i < ARRAY_SIZE(xgmi3x16_pcs_err_status_reg_v6=
_4); i++)
+                       pcs_clear_status(adev,
+                                       xgmi3x16_pcs_err_status_reg_v6_4[i]=
);
+               break;
+       default:
+               break;
+       }
 }

 static int amdgpu_xgmi_query_pcs_error_status(struct amdgpu_device *adev, =
@@ -975,7 +995,9 @@ static int amdgpu_xgmi_query_pcs_error_status(struct am=
dgpu_device *adev,

        if (is_xgmi_pcs) {
                if (amdgpu_ip_version(adev, XGMI_HWIP, 0) =3D=3D
-                   IP_VERSION(6, 1, 0)) {
+                   IP_VERSION(6, 1, 0) ||
+                   amdgpu_ip_version(adev, XGMI_HWIP, 0) =3D=3D
+                   IP_VERSION(6, 4, 0)) {
                        pcs_ras_fields =3D &xgmi3x16_pcs_ras_fields[0];
                        field_array_size =3D ARRAY_SIZE(xgmi3x16_pcs_ras_fi=
elds);
                } else {
@@ -1013,7 +1035,7 @@ static void amdgpu_xgmi_query_ras_error_count(struct =
amdgpu_device *adev,
                                             void *ras_error_status)
 {
        struct ras_err_data *err_data =3D (struct ras_err_data *)ras_error_=
status;
-       int i;
+       int i, supported =3D 1;
        uint32_t data, mask_data =3D 0;
        uint32_t ue_cnt =3D 0, ce_cnt =3D 0;

@@ -1077,7 +1099,25 @@ static void amdgpu_xgmi_query_ras_error_count(struct=
 amdgpu_device *adev,
                }
                break;
        default:
-               dev_warn(adev->dev, "XGMI RAS error query not supported");
+               supported =3D 0;
+               break;
+       }
+
+       switch (amdgpu_ip_version(adev, XGMI_HWIP, 0)) {
+       case IP_VERSION(6, 4, 0):
+               /* check xgmi3x16 pcs error */
+               for (i =3D 0; i < ARRAY_SIZE(xgmi3x16_pcs_err_status_reg_v6=
_4); i++) {
+                       data =3D RREG32_PCIE(xgmi3x16_pcs_err_status_reg_v6=
_4[i]);
+                       mask_data =3D
+                               RREG32_PCIE(xgmi3x16_pcs_err_noncorrectable=
_mask_reg_v6_4[i]);
+                       if (data)
+                               amdgpu_xgmi_query_pcs_error_status(adev, da=
ta,
+                                               mask_data, &ue_cnt, &ce_cnt=
, true, true);
+               }
+               break;
+       default:
+               if (!supported)
+                       dev_warn(adev->dev, "XGMI RAS error query not suppo=
rted");
                break;
        }

--
2.35.1

