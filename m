Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0521B9522
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2020 04:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF6C89186;
	Mon, 27 Apr 2020 02:32:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CD489186
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2020 02:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfR6t0pHn3AqnKzcf7OjhluEKHHQmG8ItPXC0T3zj4Yj5tpdhKQZUYsGkIFlhvRdjlfkXRQDRRsF47lQIyW9nIvPh0HsxFsZccngtwFyfHqfMcrJBZXpbWVVVxSFArCJzsN2DqUA+I0BnnA2G7tppy2lbP97qUpEzMQW2tCWoe/Ib80JSQEJYXxW7NEJB9U+oiO+oGQgfraswPET9gVRIRU2tDpmUeEQNN7Z3vnjTzHPgEZHCao/2zQeidFnqy3afklmOCcac3PtEyckXvno/b3oSeoj0oaCRy0Du+EPUq9gi7Q1qOTEyeFfrdvLrfk09sUliQaIbiUeOtfONFzWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BerN0NvZQKRqsal9I2r3I6odjVK1IYe56xDikqU+IME=;
 b=NXpF/7maMq3Stf71NF2bGjP/0qTtdAa4+4/3/lnpBkkmFUmWrZiK0FevE+Su7E28D8qJLwaQjN12Xzqbap2PFnEOUcBEpZGSrAi30ET8efqcSfdokGUorCZOfLGE/J3NchLJp3vPohrZF42KzWWLSrJHxcXTocSOmt+iUofjfeEdBRZmJrbxfs4w3qi5oBvCC/Nlmr9qevSH+Ay0B/QPwn36tFYZWFmSZiZOMg5rYIHnwZNbt+b0pqvqQ+KjmjPtmwwVGkToVUl5UeQFEximZRRPSWOKPSZ9uM+YLKEzOkUR/4HNhULpsAEu8wyT9znjrMBIFIwye1RfgQeSLNtSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BerN0NvZQKRqsal9I2r3I6odjVK1IYe56xDikqU+IME=;
 b=wgWPR9C0EbHwpTTf/DtmYyRjJIVfmQBlh+eEvVDi0qD5vYFAlmKsuMh/ijEnz+q+uUngn8QQv+Aw5Wu4t6owZEvxf1JCU9L2sh57EyKc29fuvBUs2i+UicUMPUIfh7hh7vXcS6pZg5u9/uFp7Z6sOszjx1FPNB0qOuqAbLa1ofg=
Received: from BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 02:32:41 +0000
Received: from BY5PR12MB4209.namprd12.prod.outlook.com
 ([fe80::914:b35a:32a:637d]) by BY5PR12MB4209.namprd12.prod.outlook.com
 ([fe80::914:b35a:32a:637d%4]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 02:32:41 +0000
From: "Zhou, Tiecheng" <Tiecheng.Zhou@amd.com>
To: "Zhou, Tiecheng" <Tiecheng.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: avoid using pm_en before it is
 initialized revised
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: avoid using pm_en before it is
 initialized revised
Thread-Index: AQHWHDczP0VFx3r4R0C44IV79p0QxKiMP29g
Date: Mon, 27 Apr 2020 02:32:41 +0000
Message-ID: <BY5PR12MB420993CD5DDDC5B4D42B8871E4AF0@BY5PR12MB4209.namprd12.prod.outlook.com>
References: <20200427015719.12471-1-Tiecheng.Zhou@amd.com>
In-Reply-To: <20200427015719.12471-1-Tiecheng.Zhou@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-27T02:32:37Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=ad0fd722-347a-4ba9-8ccd-0000994f1b6f;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-04-27T02:32:37Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: a7604b0e-3f32-45bc-8634-0000106f5fd7
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tiecheng.Zhou@amd.com; 
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7f9826a2-f98b-49a7-2ca4-08d7ea534259
x-ms-traffictypediagnostic: BY5PR12MB4033:|BY5PR12MB4033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4033309E8220D094274C7140E4AF0@BY5PR12MB4033.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4209.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(478600001)(55016002)(9686003)(186003)(316002)(26005)(110136005)(7696005)(6506007)(53546011)(5660300002)(76116006)(66476007)(52536014)(66946007)(2906002)(4326008)(71200400001)(81156014)(8676002)(33656002)(8936002)(66446008)(66556008)(64756008)(86362001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fs6xWfQBXbbbg1bHx2qWQMowebX0jamecu5qWhI+KkOEpgXFMwFnVCUpxrb5BfmkhsWHtMNNS5GIJMKtP0DghCe8kgc0Ss+8G0xck3CjyA00qCwfrYP90sQbu9aJBHAYVyciQ5lUq4pYTPPQuC3agkxKhSalj1Ekm8tykhiRO0EDvfZQfi+i7N8XFL6bzEWjLnQlQG8uoFhqGMOLWtylZWbE27eiAL0NZhfFBDhINblHaLmvc8SqpaZuxz5ju+a51mZjuO/tsTSk6hxtZ63UIwg0Nh3bGBVIMT3K/8A4IhV6pND0NptCnTyvpS9nNbTTrADu6pi/gywfNC892IPpZGlc8YHng/CWjWLyQMWUffmTpvySHRlSpfKf0cjjtfHdv7RuMiWdZA5uzt5vIoLzLWalyOSvAtpkg3QnwXPlxL2AnLLudL8emSQyUTvjvgZ0
x-ms-exchange-antispam-messagedata: a8wA+Np1NWKZvEzxx+83by52s8UmZFmqWqIwzYz/hpjrCUMmxFYijOfsPjyRIkhD1wWcZznnvB+SGa1T4DPAYGU4BFx576Bu/vcQrYMX7mKRPrk97vXy+sxb6yXko/1efgJa8Yo3FPo47+qUwYCfZnwiQIpUMM5ILkNikBSiRYhfVqTPLpjqQ+XSAtBTh7VoFlfq8z/k3xLHyu0vO2Y+xylHj0IN3O1AFFTFl2S+0VxQLn4uOSnnFLU+xzWaQwECY91IRU2PH2filk81xRfpU07YSAa3uaTs1qcOH7MH+Rz58p0ah+/GZSaQmFJlkAOKF7qhuuP2c6stYDrioFsQCAYu9oosHLb+OACU9KHeeDY/MaUCvrCS7Y3a9JPKTS60HYigtq08YysGm3ilUqGdMr+jtaEK51cIxy416RdnteAA1ZlYfNAt0CFrYvmJhgl7/xSAfFrdsXMLQpSmwkoNfbJrtyVO+SRZXomPJIt8+tSzyLpVUlV/XJC2vxdAOb1BxcGFXhwD+i1AdRqKkmbWCGB2O6b6C0QqW6lgKgjYY6afeuAbKj+5U8dql0h50RvT/sNunlI0sSoLijGwNJEWNM84DDqvctKDcyvD5vKn4Brf89Jg+2KyeGT6uPx4P5H+go1bEL0gv1FZRpcKP/+BzhX5dYveKrrEhxTnBQtPbQYENfmfSFgGHObg9PGW/P1ItWDf8HyVHvmcB3hHSrFg3hkRJpATjoDgdKIbLj+5Z8xRuJxEuKergl/uia5vlOdfBbVWR6E85B/50wuegHNZbUgq6awDtHdAKUJ9D4FN0EM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9826a2-f98b-49a7-2ca4-08d7ea534259
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 02:32:41.1305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4eFiUc15TBoASGaCWDWjefO1HY3LrGSmv/4FvFod5icQq1RTz44p/MQ7CEcKOcN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
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
Cc: "Tao, Yintian" <Yintian.Tao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Sorry for bothering, I'm going to send another one,

It seems pm_en should not be used in get_asic_baco_capability, get_asic_baco_state, set_asic_baco_state.


-----Original Message-----
From: Tiecheng Zhou <Tiecheng.Zhou@amd.com> 
Sent: Monday, April 27, 2020 9:57 AM
To: amd-gfx@lists.freedesktop.org
Cc: Zhou, Tiecheng <Tiecheng.Zhou@amd.com>; Tao, Yintian <Yintian.Tao@amd.com>
Subject: [PATCH 2/2] drm/amd/powerplay: avoid using pm_en before it is initialized revised

hwmgr->pm_en is initialized at hwmgr_hw_init.
during amdgpu_device_init, there is amdgpu_asic_reset that calls to pp_get_asic_baco_capability, while hwmgr->pm_en has not yet been initialized.

this is to avoid using pm_en in pp_get_asic_baco_capability

Signed-off-by: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
Signed-off-by: Yintian Tao <yttao@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index 71b843f542d8..fb4ca614f6e3 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -1438,7 +1438,8 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap)
 	if (!hwmgr)
 		return -EINVAL;
 
-	if (!hwmgr->pm_en || !hwmgr->hwmgr_func->get_asic_baco_capability)
+	if (!(hwmgr->not_vf && amdgpu_dpm) ||
+		!hwmgr->hwmgr_func->get_asic_baco_capability)
 		return 0;
 
 	mutex_lock(&hwmgr->smu_lock);
--
2.17.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
