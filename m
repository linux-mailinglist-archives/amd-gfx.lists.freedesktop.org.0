Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D5F333A
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Nov 2019 16:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AED06F705;
	Thu,  7 Nov 2019 15:32:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743696F701;
 Thu,  7 Nov 2019 15:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTo6xGiZkFRU5pFVYKtAAqMWnEotdcgOmCJ37w/TytzMb78mTp6FSpTmnLuQ4q8zkGnPNHRZyhE7o+khMQCAg4PoGOyyoEDzEdIjYlhfn6OU/RcVjSRFSWblUwVn5zJFr6h66O5y4JROvOtldixFjiCcE+ZkXs7sY/PD3CyNg3UkPcfKtOy4F/WldCwmaA7dC6/ACAAuSPWlcNzcSYOddZoFGTLRVyki1ylYVKT6rEa5PaUgXwzc9GykQdx4q136FfCzdngZBCAMOmTzN/b1guRFm4YXWcEyUxTlGZeQqPfOc8sL9jUXz5ZaI0Uty+mJAXUP7SYpa1+V4qhoD4nnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQljAUWyBxW1++PbqRv2rxF84kNm04bK9HEjbd+77j8=;
 b=GRruaVipGQfHrsX0bIZhU8dHDPbZatb3Yq1q2OYkNCO3W0imzdhW2rXJbTILN5BH5PwWv0H+Ou1+3RIs+QIG2cnLr5sgRUPwW0MDaM7FJqxKSV8zpdd8ygNSe/BYtbbhzdk7YKuw6PnLmGv3FujqicTpN2I6PMQ7I4mOrdeF0E2uLokopsTcPDPo79Q7X7em0Qdi7X9HTCrPSv+JlvY0FpHOGf0UoEUftgG6A+QBFE70SOOex3lsUki43WFN78tqN/76vdcYwG0QufuDNilcxR0p380Mh8NeVeDIYe4pPMZPAuTeskQ/wJFqnRykEI4Ul/4DT3/E5wJExvsfDYuZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 MN2PR12MB3488.namprd12.prod.outlook.com (2603:10b6:208:ca::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Thu, 7 Nov 2019 15:32:27 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:26 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:23 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:23 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 06/13] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Thu, 7 Nov 2019 10:32:05 -0500
Message-ID: <20191107153212.1145-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(428003)(199004)(189003)(50466002)(6666004)(36756003)(450100002)(86362001)(446003)(11346002)(126002)(16586007)(8936002)(76176011)(476003)(48376002)(486006)(51416003)(7696005)(2906002)(336012)(4326008)(426003)(2876002)(2616005)(305945005)(47776003)(2351001)(6916009)(53416004)(14444005)(1076003)(356004)(316002)(54906003)(70586007)(186003)(70206006)(478600001)(5660300002)(81156014)(50226002)(81166006)(8676002)(26005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3488; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac408041-4778-48a5-11d3-08d76397b1c8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3488:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34888AA6C7F45F395EC15D7FE4780@MN2PR12MB3488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51gtIpmdZN0NizWlBDGJZMdHr8e8gn1I6WHceS5us2tHyx+KIukzqU6gf/oD34uLc0AwJTqTUy3lzTaRzfx+KDlWid1jnD2p9zsuMc6D6S4KgkRrsEjXeaT1BJdGAdir4x5WgkUKjRrarhFWvI0VqP0QwB3hFA/+akH7vXbNiOk9t9xVpfpobMjEZdXbe67Qj/+LwJ2afMq7EqfzFdfMpLm0lCUqGsiyOHviWWGwsCYSRDI/UeGnCcfo2VjF0+SiaAkrlFYfBK/1uSwcBTYkXrGca/CoTEocwY86aNReQUYOaIt/E0xwTbug6VME0SHtuDFSdyF1bZboM/7/wbRfpTXp99mpJpqtK5vQ4sxkUW+WImUr1gx/vGrSeQic5w4NssCHgskxx6MNa0RZrnKXDqxrqre8gNjVSS1m6Trm82XGTEfai8n1UtHGS9goWgD2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:26.9174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac408041-4778-48a5-11d3-08d76397b1c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQljAUWyBxW1++PbqRv2rxF84kNm04bK9HEjbd+77j8=;
 b=wfXr+6cyNZPEawabTPacDf0b+QL0fnHDqXwBaxO60b4RVHAFFyaF9q/wTyk3ItpKsG9ImuM/0I38xs++hF2j/M/+4M9j5gFnwk6BjBkttbsHEijCii7m6+EsQdJ9wsVJKu9u42+LwJvEVHReGaIYxtEXm7GGxyJd1EMe6sRWa+M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU3luYXB0aWNzIERQ
MS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQgdmlydHVhbCBEUENE
IHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQg
ZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNlIGh1YnMgaGF2ZSBt
YW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRvIGRldGVjdCB0aGlz
IGNhc2UuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYyAgICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgIHwgIDcgKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggYWYxY2Q5Njhh
ZGZkLi4wMmZhOGMzZDlhODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTI3MSw2ICsx
MjcxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtd
ID0gewogCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklU
KERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LAogCS8qIENINzUxMSBzZWVtcyB0byBsZWF2ZSBTSU5L
X0NPVU5UIHplcm9lZCAqLwogCXsgT1VJKDB4MDAsIDB4MDAsIDB4MDApLCBERVZJQ0VfSUQoJ0Mn
LCAnSCcsICc3JywgJzUnLCAnMScsICcxJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19T
SU5LX0NPVU5UKSB9LAorCS8qIFN5bmFwdGljcyBEUDEuNCBNU1QgaHVicyBjYW4gc3VwcG9ydCBE
U0Mgd2l0aG91dCB2aXJ0dWFsIERQQ0QgKi8KKwl7IE9VSSgweDkwLCAweENDLCAweDI0KSwgREVW
SUNFX0lEX0FOWSwgdHJ1ZSwgQklUKERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9E
UENEKSB9LAogfTsKIAogI3VuZGVmIE9VSQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKaW5kZXggZDhmOWJhMjdiNTU5Li5kNWRmMDIzMTVlMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDIyMiw2ICs0MjIyLDcgQEAgc3RydWN0IGRybV9kcF9hdXgg
KmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0
KQogewogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmltbWVkaWF0ZV91cHN0cmVhbV9wb3J0Owog
CXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmZlY19wb3J0OworCXN0cnVjdCBkcm1fZHBfZGVzYyBk
ZXNjID0geyAwIH07CiAKIAlpZiAoIXBvcnQpCiAJCXJldHVybiBOVUxMOwpAQCAtNDI3NCw2ICs0
Mjc1LDMyIEBAIHN0cnVjdCBkcm1fZHBfYXV4ICpkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQo
c3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKIAlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFs
X2RwY2QocG9ydCkpCiAJCXJldHVybiAmcG9ydC0+YXV4OwogCisJLyoKKwkgKiBTeW5hcHRpY3Mg
cXVpcmsKKwkgKiBBcHBsaWVzIHRvIHBvcnRzIGZvciB3aGljaDoKKwkgKiAtIFBoeXNpY2FsIGF1
eCBoYXMgU3luYXB0aWNzIE9VSQorCSAqIC0gRFB2MS40IG9yIGhpZ2hlcgorCSAqIC0gUG9ydCBp
cyBvbiBwcmltYXJ5IGJyYW5jaCBkZXZpY2UKKwkgKiAtIE5vdCBhIFZHQSBhZGFwdGVyIChEUF9E
V05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKQorCSAqLworCWlmICghZHJtX2RwX3JlYWRfZGVzYyhw
b3J0LT5tZ3ItPmF1eCwgJmRlc2MsIHRydWUpKQorCQlyZXR1cm4gTlVMTDsKKworCWlmIChkcm1f
ZHBfaGFzX3F1aXJrKCZkZXNjLCBEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBD
RCkgJiYKKwkgICAgcG9ydC0+bWdyLT5kcGNkW0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8x
NCAmJgorCSAgICBwb3J0LT5wYXJlbnQgPT0gcG9ydC0+bWdyLT5tc3RfcHJpbWFyeSkgeworCQl1
OCBkb3duc3RyZWFtcG9ydDsKKworCQlpZiAoZHJtX2RwX2RwY2RfcmVhZCgmcG9ydC0+YXV4LCBE
UF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5ULAorCQkJCSAgICAgJmRvd25zdHJlYW1wb3J0LCAxKSA8
IDApCisJCQlyZXR1cm4gTlVMTDsKKworCQlpZiAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NU
Uk1fUE9SVF9QUkVTRU5UKSAmJgorCQkgICAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NUUk1f
UE9SVF9UWVBFX01BU0spCisJCSAgICAgIT0gRFBfRFdOX1NUUk1fUE9SVF9UWVBFX0FOQUxPRykp
CisJCQlyZXR1cm4gcG9ydC0+bWdyLT5hdXg7CisJfQorCiAJcmV0dXJuIE5VTEw7CiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydCk7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggNWE3OTUwNzVkNWRhLi41ZmY1OWU5YmJiYjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0NjQs
NiArMTQ2NCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhlIGRyaXZlciBzaG91bGQg
aWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8KIAlEUF9EUENEX1FVSVJL
X05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklS
VFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBNU1QgRFNDIGRlc3BpdGUg
bm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0MgY2FwcyBjYW4gYmUgcmVh
ZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlEUF9EUENEX1FVSVJLX0RT
Q19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
