Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA481184005
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2020 05:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCB36E152;
	Fri, 13 Mar 2020 04:29:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB17A6E152
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2020 04:29:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JojbiP4jxopCCAwtWPRiFnrHHmvYclchIvMvv8+bosrCvBpaY1zeV9nGPx9Ieubq/opjkTJJPnvaQypHJ/rseHzQhUL0M3+OXD2T6XOpeEd5SBk58oyFzRizc+qBomC7Wn3xLgLQItb31GS6xU2j2ogzZNr0BsvBL46tRS8voh7IgaNogIM28ckj8DHshm9d9hojBqdiojynk+PKFf98ToGp5nBAAkJDulOFGCowspBF/xAucBjBSc+EwDyAw5P++5TNpfVjU7qgjQ3onDcBVDTQrhO153NJlYkxILWjsZXXoO9f4hFXA3GxaEPz5YNYAqRk6x2pdeLyg9NChUi5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rahoK1KT4CcD2Rwi3QysAQKZRT/Gg/cKo4mrsjSQkaY=;
 b=PL5fD6/b0jnme3VokhRy6HbXLzSGfqds+S+FDC7KFYgRN7kHpa2a1kAghnwpdGed/0Y59s9YDlllMRM6GLIBc2mMBVquTQDeunBTesRgYqyLLlgpLJer3JrVbvp9sED+CtxiIC0FBNqTkk1X0qmeSPDVtJxS11Qxk7LkaXiHUubDLPgTVAcUINWmxsrf+JeDb7qhsYVAgpeuBd5aMo2oUKDHv79gG30GxiETvp0xK3PQi8tOIMaZL6fySWi/zv7CREuWzAztDwioY8CBWoXZT/zwZkgvAu8f/6GlKskePZQFyed2ZtyjBt5Y306EnKoVd6sd8B/6cPmxfqEFqY5beA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rahoK1KT4CcD2Rwi3QysAQKZRT/Gg/cKo4mrsjSQkaY=;
 b=b9zgoWegScuSC65ACOkBUn0hBVC6V9f12cn0/Pw2TpHRD09i3tQOkGfGtTkcHUzzrWpvPk2pDsW1pL5WPzbSfBVdWJMdNYoxZbiSVpgblzJAHTOCQ4KvgmzL6r3vQ8eL0/w5rVSsxzLbgEcg4hwZUthCQxHm0Ams5EMzGLPKFR8=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1223.namprd12.prod.outlook.com (2603:10b6:903:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Fri, 13 Mar
 2020 04:29:24 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::74d2:68e2:beee:e901]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::74d2:68e2:beee:e901%11]) with mapi id 15.20.2793.018; Fri, 13 Mar
 2020 04:29:24 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: add codes to clear AccVGPR for arcturus
Thread-Topic: [PATCH v2] drm/amdgpu: add codes to clear AccVGPR for arcturus
Thread-Index: AQHV+Oak25HYzsnaaUKSgNad19EsUKhF3tKAgAAPL/A=
Date: Fri, 13 Mar 2020 04:29:24 +0000
Message-ID: <CY4PR12MB1287C1DF1ED33B77DC337094F1FA0@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20200313032222.9799-1-Dennis.Li@amd.com>
 <DM6PR12MB4075C9F283CF3D8DC39C1F8FFCFA0@DM6PR12MB4075.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4075C9F283CF3D8DC39C1F8FFCFA0@DM6PR12MB4075.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-03-13T03:34:30Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=d9b442c9-a22a-4b6e-a300-000070fc04b3;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-03-13T04:29:19Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: af87006b-e25a-42c5-a45e-0000fd66d571
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
x-originating-ip: [101.224.57.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bca67878-b99e-4fb4-8d64-08d7c7071bed
x-ms-traffictypediagnostic: CY4PR12MB1223:|CY4PR12MB1223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB12238EF43B6C0F21736EEE17F1FA0@CY4PR12MB1223.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(53546011)(64756008)(110136005)(5660300002)(66476007)(71200400001)(6636002)(66556008)(66946007)(6506007)(7696005)(4326008)(26005)(33656002)(186003)(2906002)(55016002)(478600001)(316002)(76116006)(66446008)(9686003)(8936002)(52536014)(86362001)(81156014)(8676002)(30864003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1223;
 H:CY4PR12MB1287.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQAP/9S6ogIfPuTIeuiDgGmEoSaaLVEuDyWtyix5T0T2ZTflaD9yCREnxbIkZgrdQKE7HAU0Vvg3yuCVsrHT8YwURJJnW7/kMdRBhQEJHAuXtJ6uxkSKWQ9T01GgDfgRelD9ybTr4/gF7IJIjH4zNgnIff+dVTLQfRA1Uk68NJ8QPACfYwoIznSNDgFh3Ywennk0KYFOjF2McPIS9YWIPUImoNR9fo2zOg1M13zwW7IgfHhCQKlPeg+ppRy4tL/u0b+Angh8nuehaOJTIcvCvVUDynuJBueFn0nT3og3YHTtKPWCXglDeKcx9T1gSYW5cbTHa69/3Uo0KJhRs+8bScJZycwh0i1X1KFO8lT2lWONNgvyy/iKguNfapr30loh7XBU4j2PacDr0tu19/CSjDeSaV5y9U0enwioZGqVLbFRZ0ChusKNLOrgpWSTQkni
x-ms-exchange-antispam-messagedata: iFdMI1nGZ4HtfTh4pWCcrggg4g5Wh0O4WrFoObqarOjz/1MUk8tbWeNF85vmiTVeIR+1lGLcFb9gKGI3MvrE515mvwRjhG1XQyCYZKhHGXjcAHRGOHwW8+jzkN4/7cyEIKdf2mOFfwpjpqUHkTLzWw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca67878-b99e-4fb4-8d64-08d7c7071bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 04:29:24.1586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6LlMRJb3FiscAvBVRDmx9yEv2gF9BIxi64UI6YmKL/qp0Is6Pu+/XI04DwIM8yH5Y7IBoC2O3oLX2HiDRFWxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1223
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
Cc: "Li, Dennis" <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Looks file mode is changed.
old mode 100644
new mode 100755

Regards,
Guchun

-----Original Message-----
From: Zhang, Hawking <Hawking.Zhang@amd.com> 
Sent: Friday, March 13, 2020 11:35 AM
To: Li, Dennis <Dennis.Li@amd.com>; amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>
Cc: Li, Dennis <Dennis.Li@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: add codes to clear AccVGPR for arcturus

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking

-----Original Message-----
From: Dennis Li <Dennis.Li@amd.com> 
Sent: Friday, March 13, 2020 11:22
To: amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>
Cc: Li, Dennis <Dennis.Li@amd.com>
Subject: [PATCH v2] drm/amdgpu: add codes to clear AccVGPR for arcturus

AccVGPRs are newly added in arcturus. Before reading these registers, they should be initialized. Otherwise edc error happens, when RAS is enabled.

v2: reuse the existing logical to calculate register size

Change-Id: I4ed384f0cc4b781a10cfd6ad1e3a132445bdc261
Signed-off-by: Dennis Li <Dennis.Li@amd.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
old mode 100644
new mode 100755
index c78ffdc51373..324838baa71c
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4144,6 +4144,101 @@ static const u32 sgpr_init_compute_shader[] =
 	0xbe800080, 0xbf810000,
 };
 
+static const u32 vgpr_init_compute_shader_arcturus[] = {
+	0xd3d94000, 0x18000080, 0xd3d94001, 0x18000080, 0xd3d94002, 0x18000080,
+	0xd3d94003, 0x18000080, 0xd3d94004, 0x18000080, 0xd3d94005, 0x18000080,
+	0xd3d94006, 0x18000080, 0xd3d94007, 0x18000080, 0xd3d94008, 0x18000080,
+	0xd3d94009, 0x18000080, 0xd3d9400a, 0x18000080, 0xd3d9400b, 0x18000080,
+	0xd3d9400c, 0x18000080, 0xd3d9400d, 0x18000080, 0xd3d9400e, 0x18000080,
+	0xd3d9400f, 0x18000080, 0xd3d94010, 0x18000080, 0xd3d94011, 0x18000080,
+	0xd3d94012, 0x18000080, 0xd3d94013, 0x18000080, 0xd3d94014, 0x18000080,
+	0xd3d94015, 0x18000080, 0xd3d94016, 0x18000080, 0xd3d94017, 0x18000080,
+	0xd3d94018, 0x18000080, 0xd3d94019, 0x18000080, 0xd3d9401a, 0x18000080,
+	0xd3d9401b, 0x18000080, 0xd3d9401c, 0x18000080, 0xd3d9401d, 0x18000080,
+	0xd3d9401e, 0x18000080, 0xd3d9401f, 0x18000080, 0xd3d94020, 0x18000080,
+	0xd3d94021, 0x18000080, 0xd3d94022, 0x18000080, 0xd3d94023, 0x18000080,
+	0xd3d94024, 0x18000080, 0xd3d94025, 0x18000080, 0xd3d94026, 0x18000080,
+	0xd3d94027, 0x18000080, 0xd3d94028, 0x18000080, 0xd3d94029, 0x18000080,
+	0xd3d9402a, 0x18000080, 0xd3d9402b, 0x18000080, 0xd3d9402c, 0x18000080,
+	0xd3d9402d, 0x18000080, 0xd3d9402e, 0x18000080, 0xd3d9402f, 0x18000080,
+	0xd3d94030, 0x18000080, 0xd3d94031, 0x18000080, 0xd3d94032, 0x18000080,
+	0xd3d94033, 0x18000080, 0xd3d94034, 0x18000080, 0xd3d94035, 0x18000080,
+	0xd3d94036, 0x18000080, 0xd3d94037, 0x18000080, 0xd3d94038, 0x18000080,
+	0xd3d94039, 0x18000080, 0xd3d9403a, 0x18000080, 0xd3d9403b, 0x18000080,
+	0xd3d9403c, 0x18000080, 0xd3d9403d, 0x18000080, 0xd3d9403e, 0x18000080,
+	0xd3d9403f, 0x18000080, 0xd3d94040, 0x18000080, 0xd3d94041, 0x18000080,
+	0xd3d94042, 0x18000080, 0xd3d94043, 0x18000080, 0xd3d94044, 0x18000080,
+	0xd3d94045, 0x18000080, 0xd3d94046, 0x18000080, 0xd3d94047, 0x18000080,
+	0xd3d94048, 0x18000080, 0xd3d94049, 0x18000080, 0xd3d9404a, 0x18000080,
+	0xd3d9404b, 0x18000080, 0xd3d9404c, 0x18000080, 0xd3d9404d, 0x18000080,
+	0xd3d9404e, 0x18000080, 0xd3d9404f, 0x18000080, 0xd3d94050, 0x18000080,
+	0xd3d94051, 0x18000080, 0xd3d94052, 0x18000080, 0xd3d94053, 0x18000080,
+	0xd3d94054, 0x18000080, 0xd3d94055, 0x18000080, 0xd3d94056, 0x18000080,
+	0xd3d94057, 0x18000080, 0xd3d94058, 0x18000080, 0xd3d94059, 0x18000080,
+	0xd3d9405a, 0x18000080, 0xd3d9405b, 0x18000080, 0xd3d9405c, 0x18000080,
+	0xd3d9405d, 0x18000080, 0xd3d9405e, 0x18000080, 0xd3d9405f, 0x18000080,
+	0xd3d94060, 0x18000080, 0xd3d94061, 0x18000080, 0xd3d94062, 0x18000080,
+	0xd3d94063, 0x18000080, 0xd3d94064, 0x18000080, 0xd3d94065, 0x18000080,
+	0xd3d94066, 0x18000080, 0xd3d94067, 0x18000080, 0xd3d94068, 0x18000080,
+	0xd3d94069, 0x18000080, 0xd3d9406a, 0x18000080, 0xd3d9406b, 0x18000080,
+	0xd3d9406c, 0x18000080, 0xd3d9406d, 0x18000080, 0xd3d9406e, 0x18000080,
+	0xd3d9406f, 0x18000080, 0xd3d94070, 0x18000080, 0xd3d94071, 0x18000080,
+	0xd3d94072, 0x18000080, 0xd3d94073, 0x18000080, 0xd3d94074, 0x18000080,
+	0xd3d94075, 0x18000080, 0xd3d94076, 0x18000080, 0xd3d94077, 0x18000080,
+	0xd3d94078, 0x18000080, 0xd3d94079, 0x18000080, 0xd3d9407a, 0x18000080,
+	0xd3d9407b, 0x18000080, 0xd3d9407c, 0x18000080, 0xd3d9407d, 0x18000080,
+	0xd3d9407e, 0x18000080, 0xd3d9407f, 0x18000080, 0xd3d94080, 0x18000080,
+	0xd3d94081, 0x18000080, 0xd3d94082, 0x18000080, 0xd3d94083, 0x18000080,
+	0xd3d94084, 0x18000080, 0xd3d94085, 0x18000080, 0xd3d94086, 0x18000080,
+	0xd3d94087, 0x18000080, 0xd3d94088, 0x18000080, 0xd3d94089, 0x18000080,
+	0xd3d9408a, 0x18000080, 0xd3d9408b, 0x18000080, 0xd3d9408c, 0x18000080,
+	0xd3d9408d, 0x18000080, 0xd3d9408e, 0x18000080, 0xd3d9408f, 0x18000080,
+	0xd3d94090, 0x18000080, 0xd3d94091, 0x18000080, 0xd3d94092, 0x18000080,
+	0xd3d94093, 0x18000080, 0xd3d94094, 0x18000080, 0xd3d94095, 0x18000080,
+	0xd3d94096, 0x18000080, 0xd3d94097, 0x18000080, 0xd3d94098, 0x18000080,
+	0xd3d94099, 0x18000080, 0xd3d9409a, 0x18000080, 0xd3d9409b, 0x18000080,
+	0xd3d9409c, 0x18000080, 0xd3d9409d, 0x18000080, 0xd3d9409e, 0x18000080,
+	0xd3d9409f, 0x18000080, 0xd3d940a0, 0x18000080, 0xd3d940a1, 0x18000080,
+	0xd3d940a2, 0x18000080, 0xd3d940a3, 0x18000080, 0xd3d940a4, 0x18000080,
+	0xd3d940a5, 0x18000080, 0xd3d940a6, 0x18000080, 0xd3d940a7, 0x18000080,
+	0xd3d940a8, 0x18000080, 0xd3d940a9, 0x18000080, 0xd3d940aa, 0x18000080,
+	0xd3d940ab, 0x18000080, 0xd3d940ac, 0x18000080, 0xd3d940ad, 0x18000080,
+	0xd3d940ae, 0x18000080, 0xd3d940af, 0x18000080, 0xd3d940b0, 0x18000080,
+	0xd3d940b1, 0x18000080, 0xd3d940b2, 0x18000080, 0xd3d940b3, 0x18000080,
+	0xd3d940b4, 0x18000080, 0xd3d940b5, 0x18000080, 0xd3d940b6, 0x18000080,
+	0xd3d940b7, 0x18000080, 0xd3d940b8, 0x18000080, 0xd3d940b9, 0x18000080,
+	0xd3d940ba, 0x18000080, 0xd3d940bb, 0x18000080, 0xd3d940bc, 0x18000080,
+	0xd3d940bd, 0x18000080, 0xd3d940be, 0x18000080, 0xd3d940bf, 0x18000080,
+	0xd3d940c0, 0x18000080, 0xd3d940c1, 0x18000080, 0xd3d940c2, 0x18000080,
+	0xd3d940c3, 0x18000080, 0xd3d940c4, 0x18000080, 0xd3d940c5, 0x18000080,
+	0xd3d940c6, 0x18000080, 0xd3d940c7, 0x18000080, 0xd3d940c8, 0x18000080,
+	0xd3d940c9, 0x18000080, 0xd3d940ca, 0x18000080, 0xd3d940cb, 0x18000080,
+	0xd3d940cc, 0x18000080, 0xd3d940cd, 0x18000080, 0xd3d940ce, 0x18000080,
+	0xd3d940cf, 0x18000080, 0xd3d940d0, 0x18000080, 0xd3d940d1, 0x18000080,
+	0xd3d940d2, 0x18000080, 0xd3d940d3, 0x18000080, 0xd3d940d4, 0x18000080,
+	0xd3d940d5, 0x18000080, 0xd3d940d6, 0x18000080, 0xd3d940d7, 0x18000080,
+	0xd3d940d8, 0x18000080, 0xd3d940d9, 0x18000080, 0xd3d940da, 0x18000080,
+	0xd3d940db, 0x18000080, 0xd3d940dc, 0x18000080, 0xd3d940dd, 0x18000080,
+	0xd3d940de, 0x18000080, 0xd3d940df, 0x18000080, 0xd3d940e0, 0x18000080,
+	0xd3d940e1, 0x18000080, 0xd3d940e2, 0x18000080, 0xd3d940e3, 0x18000080,
+	0xd3d940e4, 0x18000080, 0xd3d940e5, 0x18000080, 0xd3d940e6, 0x18000080,
+	0xd3d940e7, 0x18000080, 0xd3d940e8, 0x18000080, 0xd3d940e9, 0x18000080,
+	0xd3d940ea, 0x18000080, 0xd3d940eb, 0x18000080, 0xd3d940ec, 0x18000080,
+	0xd3d940ed, 0x18000080, 0xd3d940ee, 0x18000080, 0xd3d940ef, 0x18000080,
+	0xd3d940f0, 0x18000080, 0xd3d940f1, 0x18000080, 0xd3d940f2, 0x18000080,
+	0xd3d940f3, 0x18000080, 0xd3d940f4, 0x18000080, 0xd3d940f5, 0x18000080,
+	0xd3d940f6, 0x18000080, 0xd3d940f7, 0x18000080, 0xd3d940f8, 0x18000080,
+	0xd3d940f9, 0x18000080, 0xd3d940fa, 0x18000080, 0xd3d940fb, 0x18000080,
+	0xd3d940fc, 0x18000080, 0xd3d940fd, 0x18000080, 0xd3d940fe, 0x18000080,
+	0xd3d940ff, 0x18000080, 0xb07c0000, 0xbe8a00ff, 0x000000f8, 0xbf11080a,
+	0x7e000280, 0x7e020280, 0x7e040280, 0x7e060280, 0x7e080280, 0x7e0a0280,
+	0x7e0c0280, 0x7e0e0280, 0x808a880a, 0xbe80320a, 0xbf84fff5, 0xbf9c0000,
+	0xd28c0001, 0x0001007f, 0xd28d0001, 0x0002027e, 0x10020288, 0xb88b0904,
+	0xb78b4000, 0xd1196a01, 0x00001701, 0xbe8a0087, 0xbefc00c1, 0xd89c4000,
+	0x00020201, 0xd89cc080, 0x00040401, 0x320202ff, 0x00000800, 0x808a810a,
+	0xbf84fff8, 0xbf810000,
+};
+
 /* When below register arrays changed, please update gpr_reg_size,
   and sec_ded_counter_reg_size in function gfx_v9_0_do_edc_gpr_workarounds,
   to cover all gfx9 ASICs */
@@ -4164,6 +4259,23 @@ static const struct soc15_reg_entry vgpr_init_regs[] = {
    { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xffffffff },  };
 
+static const struct soc15_reg_entry vgpr_init_regs_arcturus[] = {
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_NUM_THREAD_X), 0x40 },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_NUM_THREAD_Y), 4 },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_NUM_THREAD_Z), 1 },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_PGM_RSRC1), 0x81 },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_PGM_RSRC2), 0x400000 },  /* 64KB LDS */
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE2), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE3), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE4), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE5), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE6), 0xffffffff },
+   { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_STATIC_THREAD_MGMT_SE7), 
+0xffffffff }, };
+
 static const struct soc15_reg_entry sgpr1_init_regs[] = {
    { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
    { SOC15_REG_ENTRY(GC, 0, mmCOMPUTE_NUM_THREAD_X), 0x40 }, @@ -4294,7 +4406,10 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 						adev->gfx.config.max_cu_per_sh *
 						adev->gfx.config.max_sh_per_se;
 	int sgpr_work_group_size = 5;
-	int gpr_reg_size = compute_dim_x / 16 + 6;
+	int gpr_reg_size = adev->gfx.config.max_shader_engines + 6;
+	int vgpr_init_shader_size;
+	const u32 *vgpr_init_shader_ptr;
+	const struct soc15_reg_entry *vgpr_init_regs_ptr;
 
 	/* only support when RAS is enabled */
 	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX)) @@ -4304,6 +4419,16 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 	if (!ring->sched.ready)
 		return 0;
 
+	if (adev->asic_type == CHIP_ARCTURUS) {
+		vgpr_init_shader_ptr = vgpr_init_compute_shader_arcturus;
+		vgpr_init_shader_size = sizeof(vgpr_init_compute_shader_arcturus);
+		vgpr_init_regs_ptr = vgpr_init_regs_arcturus;
+	} else {
+		vgpr_init_shader_ptr = vgpr_init_compute_shader;
+		vgpr_init_shader_size = sizeof(vgpr_init_compute_shader);
+		vgpr_init_regs_ptr = vgpr_init_regs;
+	}
+
 	total_size =
 		(gpr_reg_size * 3 + 4 + 5 + 2) * 4; /* VGPRS */
 	total_size +=
@@ -4312,7 +4437,7 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 		(gpr_reg_size * 3 + 4 + 5 + 2) * 4; /* SGPRS2 */
 	total_size = ALIGN(total_size, 256);
 	vgpr_offset = total_size;
-	total_size += ALIGN(sizeof(vgpr_init_compute_shader), 256);
+	total_size += ALIGN(vgpr_init_shader_size, 256);
 	sgpr_offset = total_size;
 	total_size += sizeof(sgpr_init_compute_shader);
 
@@ -4325,8 +4450,8 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 	}
 
 	/* load the compute shaders */
-	for (i = 0; i < ARRAY_SIZE(vgpr_init_compute_shader); i++)
-		ib.ptr[i + (vgpr_offset / 4)] = vgpr_init_compute_shader[i];
+	for (i = 0; i < vgpr_init_shader_size/sizeof(u32); i++)
+		ib.ptr[i + (vgpr_offset / 4)] = vgpr_init_shader_ptr[i];
 
 	for (i = 0; i < ARRAY_SIZE(sgpr_init_compute_shader); i++)
 		ib.ptr[i + (sgpr_offset / 4)] = sgpr_init_compute_shader[i]; @@ -4338,9 +4463,9 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 	/* write the register state for the compute dispatch */
 	for (i = 0; i < gpr_reg_size; i++) {
 		ib.ptr[ib.length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
-		ib.ptr[ib.length_dw++] = SOC15_REG_ENTRY_OFFSET(vgpr_init_regs[i])
+		ib.ptr[ib.length_dw++] = 
+SOC15_REG_ENTRY_OFFSET(vgpr_init_regs_ptr[i])
 								- PACKET3_SET_SH_REG_START;
-		ib.ptr[ib.length_dw++] = vgpr_init_regs[i].reg_value;
+		ib.ptr[ib.length_dw++] = vgpr_init_regs_ptr[i].reg_value;
 	}
 	/* write the shader start address: mmCOMPUTE_PGM_LO, mmCOMPUTE_PGM_HI */
 	gpu_addr = (ib.gpu_addr + (u64)vgpr_offset) >> 8; @@ -4352,7 +4477,7 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 
 	/* write dispatch packet */
 	ib.ptr[ib.length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
-	ib.ptr[ib.length_dw++] = compute_dim_x; /* x */
+	ib.ptr[ib.length_dw++] = compute_dim_x * 2; /* x */
 	ib.ptr[ib.length_dw++] = 1; /* y */
 	ib.ptr[ib.length_dw++] = 1; /* z */
 	ib.ptr[ib.length_dw++] =
--
2.17.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
