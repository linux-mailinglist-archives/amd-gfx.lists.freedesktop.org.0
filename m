Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42853253E9A
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Aug 2020 09:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54E26EB11;
	Thu, 27 Aug 2020 07:07:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA736EB11
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Aug 2020 07:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTlV7av1GZcRWfWgV67JJkLcUr/jSL0GbQavEFqaJY0OvpKC3Pqi6/1eVu40sJNeLVOlFlM8yNtOJjywK3wWTmPaiWiM+9z4MMEuVvdQrVRCEyv50e5BMdEBUqa/L8ziJFSz7tvsxWbRTd7i8IYDYQbjUWk3zwbVZdEVFW4uWhLGcfO0sv61tuAl7S1d50cYXQHsMt6nahzJJQylC+rG61+M5TY/e4p1pnebRLJHk1WBxseX2RF+oKTtVl+vEP7zKEFZfSqjlPCRdeEy/W+QW5dJbXA6usX2Pi8+jqHsZvPlW/lrXZVNlB1aFmk2BeBm0Vx5caKxzF3Fc6+4hDoAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKPPGyBAxNehN4FA1gpqwBE1yvD8WyDaOYXYVu7IlPw=;
 b=PTsWr0ypUeCeUOMLeIn/taZxRAu6Td1TtUQpr1gc1TzOMfAB62+GbiqxSC75J2+mgIHQ8WviAOutddS3u0TTRX4Gs+kwhLZXn1/ZltoFahbOxrrIalsYn8x/pl7dceJww3+Y1RAm4HAGL3GX3B4nK2roKqKI7ONzVRsu1hu6niYnvWjSj18/Ywxnrfv/0HIsjUFaOIrzT7b4DZgJT9s944ka0MuqW8IOBZQAVLOEiDhf+yK0DlZjbeuNUDRFgtYKEJHwfA4UPIo6SrWkZRM6s0LBlODdvIBviMohlsZuhavCtrqTR3c5J+p0mfZ04HNIJQh1s165GxM5xUhRZKSiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKPPGyBAxNehN4FA1gpqwBE1yvD8WyDaOYXYVu7IlPw=;
 b=ZAf+a1ElxIY7JeGrOpd2i1WvJm75gXCQ2Vzjaikfd7r1bqGlEX0R72iXe70OCwbMyf7G6l4MEilBV+o6+UlHAJ7h8kIGUSa65rajYP7Al8crnFqsI0cnm/vbJdfO6k1pu+OEIDKi75dP9oli0jEK8Q2CFeoEIlYUxtdtbZBzuTw=
Received: from BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 by BYAPR12MB3576.namprd12.prod.outlook.com (2603:10b6:a03:d8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 07:07:32 +0000
Received: from BY5PR12MB4115.namprd12.prod.outlook.com
 ([fe80::1d86:f142:9f3d:eb07]) by BY5PR12MB4115.namprd12.prod.outlook.com
 ([fe80::1d86:f142:9f3d:eb07%8]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 07:07:32 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhang, Bokun" <Bokun.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] SWDEV-220451 - Query guest's information by VF2PF message
 - Guest side - part 1
Thread-Topic: [PATCH] SWDEV-220451 - Query guest's information by VF2PF
 message - Guest side - part 1
Thread-Index: AQHWaz7UYKssT+b4PEKCu9VBLRZUUalLqt6Q
Date: Thu, 27 Aug 2020 07:07:32 +0000
Message-ID: <BY5PR12MB4115AE4EA1EE1ECB512211528F550@BY5PR12MB4115.namprd12.prod.outlook.com>
References: <20200805153222.33202-1-Bokun.Zhang@amd.com>
In-Reply-To: <20200805153222.33202-1-Bokun.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=ec3233b8-d2ca-44d2-b5f8-5a26561667b2;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-27T07:07:10Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc8b3391-9401-4af8-112d-08d84a57de6b
x-ms-traffictypediagnostic: BYAPR12MB3576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB357641477EDE138866E2C1F08F550@BYAPR12MB3576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1syWzl2cNqnGEGBCoSvVIfuw/VLbifaOHBJIguWdzzEewGmOK69qLmgQ43DD4IJernSHvgOeArwrUHNg9PcnQ+pnNrQUV+jD6qL5OhFUfYppv1GPjzaOLL4DD8q2d8KdyGOuXklWeKP/bWU1A/0RAnKRUlYRiS9Q6pZx5Qr0rKlCYgZ39jq3PH0gz3kaqna8bHybJHBtcEBGvtc+3SJY5FF8TrNZHucfjlXlEs7k3PkeEVKcDGbC85ZpxdPd6JA/AbWGO4qraxWeoJHUZLusKkl9XCjWfTjzBQqtMnAQQMdPS8yvgXZVE5CIn5VK+S4CFRsbirhMsUqmeZJ97e3MAHBBiNYp9LisShqeh1DNuLg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(33656002)(316002)(7696005)(15650500001)(8676002)(9686003)(45080400002)(30864003)(2906002)(4326008)(6506007)(26005)(71200400001)(186003)(52536014)(478600001)(5660300002)(8936002)(55016002)(110136005)(86362001)(66946007)(66476007)(64756008)(66556008)(76116006)(66446008)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DB3eodGiFpVxxYG1mao0UXyI5rk5UO5vBva396U+NxUcujRkROlysKVw96zK4RGfILhKGkmwwElnF42UAHQ0hoAMK9PKrahZRpV3ipKI1c5lvCRePQuJnM8O6wWcgFa6Zeejt/BbhfqXJim/ks1HMPK8voR3KVoZPNIZheS82fq/L1T92hJszezbCHN8LyGKubrxQUVsksPoVO1yj0XhQVcSL0ke/6LguWdC8knTu4RJ/vFY8Ou4iQHyW3+cMXfI9VZJtNvft9hLf/OkLUKi4DefxKp+QWgsk3+Bj5XM7bS92POTcu/taXQJUhWq6eYMtzwgso6ZXA94UJtHJf5BRMvTnK6cep6WGFnPhCU3iRqd2ch7BK6PvlJZYuxGr4g3ubfTaLyOgDDd6+AO5FdR5wvK+MVd8vqwyRjWhOIS/r7DRFqAxx14TqtUjXJ7BUyi6oIJyaZEhFQueI3l1NZJtxnKqnSrhjCtnTje8Xs7IVPJJ/Eb1kiblOgit+g5pFNS5DR2BXfGzuSk1B88ckiXIMqSM8eEe/h17BaK1ANtx3eODTc2XDqImwHPHiPBDVMEbqE4FUTmVewwXzuVIAFOerfq6UZkLgR5BdzvCzoSFJ30gPa+XjFXf2TrRvK/4WUGZBx7wBMayFjd6hJ7ePTx5Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8b3391-9401-4af8-112d-08d84a57de6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 07:07:32.5471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eChD6SFECNMcG5rcZDOdtNehRnd3ZT2Es5iaUS0NHkirc3eZg/WKymLF3yIx/mU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3576
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
Cc: "Zhang, Bokun" <Bokun.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Emily.Deng <Emily.Deng@amd.com>

>-----Original Message-----
>From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Bokun
>Zhang
>Sent: Wednesday, August 5, 2020 11:32 PM
>To: amd-gfx@lists.freedesktop.org
>Cc: Zhang, Bokun <Bokun.Zhang@amd.com>
>Subject: [PATCH] SWDEV-220451 - Query guest's information by VF2PF
>message - Guest side - part 1
>
>- Add guest side change to support VF2PF message
>- Fix coding style
>
>Change-Id: I82e5518cb10ec0b19fecaba7e05b02f4b7f2b409
>Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h    |  29 +-
> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 276
>++++++++++++++++++++
> 2 files changed, 285 insertions(+), 20 deletions(-)  create mode 100644
>drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>index b0b2bdc750df..ad2b2628ab67 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>@@ -24,6 +24,8 @@
> #ifndef AMDGPU_VIRT_H
> #define AMDGPU_VIRT_H
>
>+#include "amdgv_sriovmsg.h"
>+
> #define AMDGPU_SRIOV_CAPS_SRIOV_VBIOS  (1 << 0) /* vBIOS is sr-iov ready
>*/
> #define AMDGPU_SRIOV_CAPS_ENABLE_IOV   (1 << 1) /* sr-iov is enabled on
>this GPU */
> #define AMDGPU_SRIOV_CAPS_IS_VF        (1 << 2) /* this GPU is a virtual
>function */
>@@ -69,7 +71,10 @@ struct amdgpu_virt_fw_reserve {
> struct amd_sriov_msg_vf2pf_info_header *p_vf2pf;
> unsigned int checksum_key;
> };
>+
> /*
>+ * Legacy GIM header
>+ *
>  * Defination between PF and VF
>  * Structures forcibly aligned to 4 to keep the same style as PF.
>  */
>@@ -89,15 +94,7 @@ enum AMDGIM_FEATURE_FLAG {
> AMDGIM_FEATURE_HW_PERF_SIMULATION = (1 << 3),  };
>
>-struct amd_sriov_msg_pf2vf_info_header {
>-/* the total structure size in byte. */
>-uint32_t size;
>-/* version of this structure, written by the GIM */
>-uint32_t version;
>-/* reserved */
>-uint32_t reserved[2];
>-} __aligned(4);
>-struct  amdgim_pf2vf_info_v1 {
>+struct amdgim_pf2vf_info_v1 {
> /* header contains size and version */
> struct amd_sriov_msg_pf2vf_info_header header;
> /* max_width * max_height */
>@@ -116,6 +113,7 @@ struct  amdgim_pf2vf_info_v1 {
> unsigned int checksum;
> } __aligned(4);
>
>+/* TODO: below struct is duplicated to amd_sriov_msg_pf2vf_info */
> struct  amdgim_pf2vf_info_v2 {
> /* header contains size and version */
> struct amd_sriov_msg_pf2vf_info_header header; @@ -146,16 +144,6
>@@ struct  amdgim_pf2vf_info_v2 {
> uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256, 0,
>0, (9 + sizeof(struct amd_sriov_msg_pf2vf_info_header)/sizeof(uint32_t)), 3)];  }
>__aligned(4);
>
>-
>-struct amd_sriov_msg_vf2pf_info_header {
>-/* the total structure size in byte. */
>-uint32_t size;
>-/*version of this structure, written by the guest */
>-uint32_t version;
>-/* reserved */
>-uint32_t reserved[2];
>-} __aligned(4);
>-
> struct amdgim_vf2pf_info_v1 {
> /* header contains size and version */
> struct amd_sriov_msg_vf2pf_info_header header; @@ -217,8 +205,9
>@@ struct amdgim_vf2pf_info_v2 {
> uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256,
>64, 0, (12 + sizeof(struct amd_sriov_msg_vf2pf_info_header)/sizeof(uint32_t)),
>0)];  } __aligned(4);
>
>+/* TODO: below macro and typedef will cause compile error, need to
>+remove */
> #define AMDGPU_FW_VRAM_VF2PF_VER 2
>-typedef struct amdgim_vf2pf_info_v2 amdgim_vf2pf_info ;
>+typedef struct amd_sriov_msg_vf2pf_info amdgim_vf2pf_info;
>
> #define AMDGPU_FW_VRAM_VF2PF_WRITE(adev, field, val) \
> do { \
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>new file mode 100644
>index 000000000000..5355827ed0ae
>--- /dev/null
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>@@ -0,0 +1,276 @@
>+/*
>+ * Copyright 2018-2019 Advanced Micro Devices, Inc.
>+ *
>+ * Permission is hereby granted, free of charge, to any person
>+obtaining a
>+ * copy of this software and associated documentation files (the
>+"Software"),
>+ * to deal in the Software without restriction, including without
>+limitation
>+ * the rights to use, copy, modify, merge, publish, distribute,
>+sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom
>+the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice shall be
>+included in
>+ * all copies or substantial portions of the Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>+EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>+MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
>EVENT
>+SHALL
>+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>+DAMAGES OR
>+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>+OTHERWISE,
>+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
>THE USE
>+OR
>+ * OTHER DEALINGS IN THE SOFTWARE.
>+ *
>+ */
>+
>+#ifndef AMDGV_SRIOV_MSG__H_
>+#define AMDGV_SRIOV_MSG__H_
>+
>+/* unit in kilobytes */
>+#define AMD_SRIOV_MSG_VBIOS_OFFSET              0
>+#define AMD_SRIOV_MSG_VBIOS_SIZE_KB             64
>+#define AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB
>AMD_SRIOV_MSG_VBIOS_SIZE_KB
>+#define AMD_SRIOV_MSG_DATAEXCHANGE_SIZE_KB      4
>+
>+/*
>+ * layout
>+ * 0           64KB        65KB        66KB
>+ * |   VBIOS   |   PF2VF   |   VF2PF   |   Bad Page   | ...
>+ * |   64KB    |   1KB     |   1KB     |
>+ */
>+#define AMD_SRIOV_MSG_SIZE_KB                   1
>+#define AMD_SRIOV_MSG_PF2VF_OFFSET_KB
>AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB
>+#define AMD_SRIOV_MSG_VF2PF_OFFSET_KB
>(AMD_SRIOV_MSG_PF2VF_OFFSET_KB + AMD_SRIOV_MSG_SIZE_KB)
>+#define AMD_SRIOV_MSG_BAD_PAGE_OFFSET_KB
>(AMD_SRIOV_MSG_VF2PF_OFFSET_KB + AMD_SRIOV_MSG_SIZE_KB)
>+
>+/*
>+ * PF2VF history log:
>+ * v1 defined in amdgim
>+ * v2 current
>+ *
>+ * VF2PF history log:
>+ * v1 defined in amdgim
>+ * v2 defined in amdgim
>+ * v3 current
>+ */
>+#define AMD_SRIOV_MSG_FW_VRAM_PF2VF_VER2
>+#define AMD_SRIOV_MSG_FW_VRAM_VF2PF_VER3
>+
>+#define AMD_SRIOV_MSG_RESERVE_UCODE24
>+
>+enum amd_sriov_ucode_engine_id {
>+AMD_SRIOV_UCODE_ID_VCE = 0,
>+AMD_SRIOV_UCODE_ID_UVD,
>+AMD_SRIOV_UCODE_ID_MC,
>+AMD_SRIOV_UCODE_ID_ME,
>+AMD_SRIOV_UCODE_ID_PFP,
>+AMD_SRIOV_UCODE_ID_CE,
>+AMD_SRIOV_UCODE_ID_RLC,
>+AMD_SRIOV_UCODE_ID_RLC_SRLC,
>+AMD_SRIOV_UCODE_ID_RLC_SRLG,
>+AMD_SRIOV_UCODE_ID_RLC_SRLS,
>+AMD_SRIOV_UCODE_ID_MEC,
>+AMD_SRIOV_UCODE_ID_MEC2,
>+AMD_SRIOV_UCODE_ID_SOS,
>+AMD_SRIOV_UCODE_ID_ASD,
>+AMD_SRIOV_UCODE_ID_TA_RAS,
>+AMD_SRIOV_UCODE_ID_TA_XGMI,
>+AMD_SRIOV_UCODE_ID_SMC,
>+AMD_SRIOV_UCODE_ID_SDMA,
>+AMD_SRIOV_UCODE_ID_SDMA2,
>+AMD_SRIOV_UCODE_ID_VCN,
>+AMD_SRIOV_UCODE_ID_DMCU,
>+AMD_SRIOV_UCODE_ID__MAX
>+};
>+
>+#pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed
>+
>+union amd_sriov_msg_feature_flags {
>+struct {
>+uint32_t  error_log_collect  : 1;
>+uint32_t  host_load_ucodes   : 1;
>+uint32_t  host_flr_vramlost  : 1;
>+uint32_t  mm_bw_management   : 1;
>+uint32_t  pp_one_vf_mode     : 1;
>+uint32_t  reserved           : 27;
>+} flags;
>+uint32_t      all;
>+};
>+
>+union amd_sriov_msg_os_info {
>+struct {
>+uint32_t  windows            : 1;
>+uint32_t  reserved           : 31;
>+} info;
>+uint32_t      all;
>+};
>+
>+struct amd_sriov_msg_pf2vf_info_header {
>+/* the total structure size in byte */
>+uint32_t size;
>+/* version of this structure, written by the HOST */
>+uint32_t version;
>+/* reserved */
>+uint32_t reserved[2];
>+};
>+
>+struct amd_sriov_msg_pf2vf_info {
>+/* header contains size and version */
>+struct amd_sriov_msg_pf2vf_info_header header;
>+/* use private key from mailbox 2 to create checksum */
>+uint32_t checksum;
>+/* The features flags of the HOST driver supports */
>+union amd_sriov_msg_feature_flags feature_flags;
>+/* (max_width * max_height * fps) / (16 * 16) */
>+uint32_t hevc_enc_max_mb_per_second;
>+/* (max_width * max_height) / (16 * 16) */
>+uint32_t hevc_enc_max_mb_per_frame;
>+/* (max_width * max_height * fps) / (16 * 16) */
>+uint32_t avc_enc_max_mb_per_second;
>+/* (max_width * max_height) / (16 * 16) */
>+uint32_t avc_enc_max_mb_per_frame;
>+/* MEC FW position in BYTE from the start of VF visible frame buffer
>*/
>+uint64_t mecfw_offset;
>+/* MEC FW size in BYTE */
>+uint32_t mecfw_size;
>+/* UVD FW position in BYTE from the start of VF visible frame buffer */
>+uint64_t uvdfw_offset;
>+/* UVD FW size in BYTE */
>+uint32_t uvdfw_size;
>+/* VCE FW position in BYTE from the start of VF visible frame buffer */
>+uint64_t vcefw_offset;
>+/* VCE FW size in BYTE */
>+uint32_t vcefw_size;
>+/* Bad pages block position in BYTE */
>+uint32_t bp_block_offset_low;
>+uint32_t bp_block_offset_high;
>+/* Bad pages block size in BYTE */
>+uint32_t bp_block_size;
>+/* frequency for VF to update the VF2PF area in msec, 0 = manual */
>+uint32_t vf2pf_update_interval_ms;
>+/* identification in ROCm SMI */
>+uint64_t uuid;
>+uint32_t fcn_idx;
>+/* reserved */
>+uint32_t reserved[256-26];
>+};
>+
>+struct amd_sriov_msg_vf2pf_info_header {
>+/* the total structure size in byte */
>+uint32_t size;
>+/* version of this structure, written by the guest */
>+uint32_t version;
>+/* reserved */
>+uint32_t reserved[2];
>+};
>+
>+struct amd_sriov_msg_vf2pf_info {
>+/* header contains size and version */
>+struct amd_sriov_msg_vf2pf_info_header header;
>+uint32_t checksum;
>+/* driver version */
>+uint8_t  driver_version[64];
>+/* driver certification, 1=WHQL, 0=None */
>+uint32_t driver_cert;
>+/* guest OS type and version */
>+union amd_sriov_msg_os_info os_info;
>+/* guest fb information in the unit of MB */
>+uint32_t fb_usage;
>+/* guest gfx engine usage percentage */
>+uint32_t gfx_usage;
>+/* guest gfx engine health percentage */
>+uint32_t gfx_health;
>+/* guest compute engine usage percentage */
>+uint32_t compute_usage;
>+/* guest compute engine health percentage */
>+uint32_t compute_health;
>+/* guest avc engine usage percentage. 0xffff means N/A */
>+uint32_t avc_enc_usage;
>+/* guest avc engine health percentage. 0xffff means N/A */
>+uint32_t avc_enc_health;
>+/* guest hevc engine usage percentage. 0xffff means N/A */
>+uint32_t hevc_enc_usage;
>+/* guest hevc engine usage percentage. 0xffff means N/A */
>+uint32_t hevc_enc_health;
>+/* combined encode/decode usage */
>+uint32_t encode_usage;
>+uint32_t decode_usage;
>+/* Version of PF2VF that VF understands */
>+uint32_t pf2vf_version_required;
>+/* additional FB usage */
>+uint32_t fb_vis_usage;
>+uint32_t fb_vis_size;
>+uint32_t fb_size;
>+/* guest ucode data, each one is 1.25 Dword */
>+struct {
>+uint8_t  id;
>+uint32_t version;
>+} ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
>+
>+/* reserved */
>+uint32_t reserved[256-68];
>+};
>+
>+/* mailbox message send from guest to host  */ enum
>+amd_sriov_mailbox_request_message {
>+MB_REQ_MSG_REQ_GPU_INIT_ACCESS = 1,
>+MB_REQ_MSG_REL_GPU_INIT_ACCESS,
>+MB_REQ_MSG_REQ_GPU_FINI_ACCESS,
>+MB_REQ_MSG_REL_GPU_FINI_ACCESS,
>+MB_REQ_MSG_REQ_GPU_RESET_ACCESS,
>+MB_REQ_MSG_REQ_GPU_INIT_DATA,
>+
>+MB_REQ_MSG_LOG_VF_ERROR       = 200,
>+};
>+
>+/* mailbox message send from host to guest  */ enum
>+amd_sriov_mailbox_response_message {
>+MB_RES_MSG_CLR_MSG_BUF = 0,
>+MB_RES_MSG_READY_TO_ACCESS_GPU = 1,
>+MB_RES_MSG_FLR_NOTIFICATION,
>+MB_RES_MSG_FLR_NOTIFICATION_COMPLETION,
>+MB_RES_MSG_SUCCESS,
>+MB_RES_MSG_FAIL,
>+MB_RES_MSG_QUERY_ALIVE,
>+MB_RES_MSG_GPU_INIT_DATA_READY,
>+
>+MB_RES_MSG_TEXT_MESSAGE = 255
>+};
>+
>+/* version data stored in MAILBOX_MSGBUF_RCV_DW1 for future expansion
>+*/ enum amd_sriov_gpu_init_data_version {
>+GPU_INIT_DATA_READY_V1 = 1,
>+};
>+
>+#pragma pack(pop)// Restore previous packing option
>+
>+/* checksum function between host and guest */ unsigned int
>+amd_sriov_msg_checksum(void *obj,
>+unsigned long obj_size,
>+unsigned int key,
>+unsigned int checksum);
>+
>+/* assertion at compile time */
>+#ifdef __linux__
>+#define stringification(s) _stringification(s) #define
>+_stringification(s) #s
>+
>+_Static_assert(
>+sizeof(struct amd_sriov_msg_vf2pf_info) ==
>AMD_SRIOV_MSG_SIZE_KB << 10,
>+"amd_sriov_msg_vf2pf_info must be "
>+stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
>+
>+_Static_assert(
>+sizeof(struct amd_sriov_msg_pf2vf_info) ==
>AMD_SRIOV_MSG_SIZE_KB << 10,
>+"amd_sriov_msg_pf2vf_info must be "
>+stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
>+
>+_Static_assert(
>+AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
>+"AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
>+
>+_Static_assert(
>+AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
>+"AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than
>+AMD_SRIOV_UCODE_ID__MAX");
>+
>+#undef _stringification
>+#undef stringification
>+#endif
>+
>+#endif /* AMDGV_SRIOV_MSG__H_ */
>--
>2.20.1
>
>_______________________________________________
>amd-gfx mailing list
>amd-gfx@lists.freedesktop.org
>https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.free
>desktop.org%2Fmailman%2Flistinfo%2Famd-
>gfx&amp;data=02%7C01%7CEmily.Deng%40amd.com%7C5573100fc1294206a
>05908d83955cce2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63
>7322388643613783&amp;sdata=eFWPZzlm%2BTHZodvP2rdbtw8hzqOjGMrk7O
>6z1rZO%2BYM%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
