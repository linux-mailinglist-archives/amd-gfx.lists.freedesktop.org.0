Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E5133D86
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2020 09:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EB46E878;
	Wed,  8 Jan 2020 08:45:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42616E197;
 Wed,  8 Jan 2020 08:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET25wrw2FGS2+gd+x9u8IYpVDV2Ro0vnV9DeWZlvSsifEDl0iS7/0Ub/XLyeswI9+nLN4QZndFI1PTNnpZjqwm5fTNKXOWOsRzs8eVDOu9usYfstijxflEhnTf2H5I/BWdHWhVTiOJcKGKNvPt0EOniRPim61H0TVTUQgWFV13h5jFwoV5i+APpm9BskuBIK5RLQhRIBDdFOEYvUfL5/RMBtChDcaUjU/7rYs1Wx69WTMJ4NDYIxoK7J/YTrCkWnqA5o67BgApwlonLxgv8ZKT7aCooGyL8SKdLj2ddHxHmybVcKKYyApnSAZyAuwPXiOBgDljklFvN8S/V+hmZTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH6yG7ONGsgA2CACY4lvyz6P9yDifny17I9V643ZfcQ=;
 b=Os4m8L8SoRfq1EgFFgiLZHqDc5m0tGv30+8JO9hMh/fSR9G54PC0A8TVSG737oPI2l4XDEw1h02MqjWqLJonOGomuUJIEzBso1S+kR0IHesryQiNlkonqujRrWHzTpOjIE7IbvlcMHtD/4c9PF94AefFhGXN6I1AzhBgMF7YqwlRPpwpNLU7vwz4xcVjwGHmScmTfGvRniWbL1zggimCOybuU3i9WvO6+eFU6WoSz6CvG0GSY0f3a3vsf2YvlQarnL1jk3pFl9v+Z/AwGDa74pITEUBBmqIqWlWdFXvyooGOUCaWUktdYemnmftK7UunzVjxLGp3CyEjoQiPkiJ8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH6yG7ONGsgA2CACY4lvyz6P9yDifny17I9V643ZfcQ=;
 b=OlGCuvaV/jvk4rwix58XcjctvuImXETHdA+vE+Xml3aeuYy9cTvFtiEgfcnnKTPfFbapG5bp+GIcI5wDcT7pVNIG0gL+4Wchr5P4hx4PW7WT/tZBG9Q6O6vpaMHhnqMI/G9wsuOh8rOFhzU2Pf/O6qB5Uye9C32p+OGXghA9LFc=
Received: from MWHPR12CA0032.namprd12.prod.outlook.com (2603:10b6:301:2::18)
 by DM6PR12MB2891.namprd12.prod.outlook.com (2603:10b6:5:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15; Wed, 8 Jan
 2020 08:45:26 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by MWHPR12CA0032.outlook.office365.com
 (2603:10b6:301:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Wed, 8 Jan 2020 08:45:26 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Wed, 8 Jan 2020 08:45:26 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 8 Jan 2020
 02:45:25 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 8 Jan 2020 02:45:23 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/dp_mst: Handle SST-only branch device case
Date: Wed, 8 Jan 2020 16:44:16 +0800
Message-ID: <20200108084416.6296-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108084416.6296-1-Wayne.Lin@amd.com>
References: <20200108084416.6296-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(428003)(189003)(199004)(6666004)(356004)(426003)(2616005)(336012)(110136005)(186003)(7696005)(316002)(70206006)(70586007)(26005)(54906003)(5660300002)(86362001)(8936002)(1076003)(4326008)(478600001)(81156014)(66574012)(36756003)(2906002)(8676002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2891; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 916a3db9-2252-4085-1e53-08d794171b95
X-MS-TrafficTypeDiagnostic: DM6PR12MB2891:
X-Microsoft-Antispam-PRVS: <DM6PR12MB289186204F2A6EAF8E86C50DFC3E0@DM6PR12MB2891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 02760F0D1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYypZYLA0TMb97sNOv7N1z8i/skb2x5Xpm7SFugpYh4D1AYOUUjKVzKljr/DbOFy6rkOfUP+Az7NaNjQ5ZrecwCrHeWIfxsx9Qxw85QGni4o0X+XdKf2lN2bajYQDZTLzFA7G4ozMiF1kziHm6w412gqom5asUkLIAHmn21xWDXxPMDq854dhKDG+72aKdh1R6QUBfVMhscSPVpQWE7E8p2sV7lbGlAl5tWZOY7MQAcSjU8ly8nn4gJCO3oJgJ19BJs4bfuO9NPQs47xwuPH58g5UY1DXrXIATJ1LKuWCSZJkbIiKDntlfmmwqEyg99YhM8M+MXsVpNgww2Y+/A/kz0gLEK604xFgq8JPWCmeEjzXh9DZuZDcKeCsfG3vBK6vKUXXuO5h5SfM/ZXYsM5II0bhVRxDnsUV7144ecCBHN7zN/tgySWD6rdFuE3pyt8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2020 08:45:26.3690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 916a3db9-2252-4085-1e53-08d794171b95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2891
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
Cc: Harry
 Wentland <hwentlan@amd.com>, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 harry.wentland@amd.com, Nicholas.Kazlauskas@amd.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2hpbGUgaGFuZGxpbmcgTElOS19BRERSRVNTIHJlcGx5LCBjdXJyZW50IGNvZGUgZXhw
ZWN0cyBhIHBlZXIgZGV2aWNlCmNhbiBoYW5kbGUgc2lkZWJhbmQgbWVzc2FnZSBvbmNlIHRoZSBw
ZWVyIGRldmljZSB0eXBlIGlzIHJlcG9ydGVkIGFzCkRQX1BFRVJfREVWSUNFX01TVF9CUkFOQ0hJ
TkcuIEhvd2V2ZXIsIHdoZW4gdGhlIGNvbm5lY3RlZCBkZXZpY2UgaXMKYSBTU1QgYnJhbmNoIGNh
c2UsIGl0IGNhbid0IGhhbmRsZSB0aGUgc2lkZWJhbmQgbWVzc2FnZShNU1RfQ0FQPTAgaW4KRFBD
RCAwMDAyMWgpLgoKQ3VycmVudCBjb2RlIHdpbGwgdHJ5IHRvIHNlbmQgTElOS19BRERSRVNTIHRv
IFNTVCBicmFuY2ggZGV2aWNlIGFuZCBlbmQKdXAgd2l0aCBtZXNzYWdlIHRpbWVvdXQgYW5kIG1v
bml0b3IgY2FuJ3QgZGlzcGxheSBub3JtYWxseS4gQXMgdGhlCnJlc3VsdCBvZiB0aGF0LCB3ZSBz
aG91bGQgdGFrZSBTU1QgYnJhbmNoIGRldmljZSBpbnRvIGFjY291bnQuCgpbSG93XQpBY2NvcmRp
bmcgdG8gRFAgMS40IHNwZWMsIHdlIGNhbiB1c2UgUGVlcl9EZXZpY2VfVHlwZSBhcwpEUF9QRUVS
X0RFVklDRV9NU1RfQlJBTkNISU5HIGFuZCBNZXNzYWdlX0NhcGFiaWxpdHlfU3RhdHVzIGFzIDAg
dG8KaW5kaWNhdGUgcGVlciBkZXZpY2UgYXMgYSBTU1Qtb25seSBicmFuY2ggZGV2aWNlLgoKRml4
IGZvbGxvd2luZzoKLSBUYWtlIFNTVC1vbmx5IGJyYW5jaCBkZXZpY2UgY2FzZSBpbnRvIGFjY291
bnQgaW4KZHJtX2RwX3BvcnRfc2V0X3BkdCgpIGFuZCBhZGQgYSBuZXcgcGFyYW1ldGVyICduZXdf
bWNzJy4gVGFrZSBzc3QgYnJhbmNoCmRldmljZSBjYXNlIGFzIHRoZSBzYW1lIGNhc2UgYXMgRFBf
UEVFUl9ERVZJQ0VfRFBfTEVHQUNZX0NPTlYgYW5kCkRQX1BFRVJfREVWSUNFX1NTVF9TSU5LLiBB
bGwgb3JpZ2luYWwgaGFuZGxpbmcgbG9naWNzIHJlbWFpbi4KLSBUYWtlIFNTVC1vbmx5IGJyYW5j
aCBkZXZpY2UgY2FzZSBpbnRvIGFjY291bnQgaW4KZHJtX2RwX21zdF9wb3J0X2FkZF9jb25uZWN0
b3IoKS4KLSBGaXggc29tZSBwYXJ0cyBpbiBkcm1fZHBfbXN0X2hhbmRsZV9saW5rX2FkZHJlc3Nf
cG9ydCgpIHRvIGhhdmUgU1NUCmJyYW5jaCBkZXZpY2UgY2FzZSBpbnRvIGNvbnNpZGVyYXRpb24u
Ci0gRml4IHRoZSBhcmd1bWVudHMgb2YgZHJtX2RwX3BvcnRfc2V0X3BkdCgpIGluCmRybV9kcF9t
c3RfaGFuZGxlX2Nvbm5fc3RhdCgpLgotIEhhdmUgU1NUIGJyYW5jaCBkZXZpY2UgYWxzbyByZXBv
cnQKY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgd2hlbiB0aGUgZGRwcyBpcyB0cnVlCmluIGRy
bV9kcF9tc3RfZGV0ZWN0X3BvcnQoKQotIEZpeCB0aGUgYXJndW1lbnRzIG9mIGRybV9kcF9wb3J0
X3NldF9wZHQoKSBpbgpkcm1fZHBfZGVsYXllZF9kZXN0cm95X3BvcnQoKQoKRml4ZXM6IGM0ODVl
MmM5N2RhZSAoImRybS9kcF9tc3Q6IFJlZmFjdG9yIHBkdCBzZXR1cC90ZWFyZG93biwgYWRkIG1v
cmUgbG9ja2luZyIpCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+CkNjOiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxp
bkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAx
MzEgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRp
b25zKCspLCA2MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YwppbmRleCA4ZjU0YjI0MWRiMDguLjQzOTVkNWNjMDY0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCkBAIC0xOTM0LDczICsxOTM0LDc0IEBAIHN0YXRpYyBib29sIGRybV9k
cF9tc3RfaXNfZHBfbXN0X2VuZF9kZXZpY2UodTggcGR0LCBib29sIG1jcykKIAlyZXR1cm4gdHJ1
ZTsKIH0KIAotc3RhdGljIGludCBkcm1fZHBfcG9ydF9zZXRfcGR0KHN0cnVjdCBkcm1fZHBfbXN0
X3BvcnQgKnBvcnQsIHU4IG5ld19wZHQpCitzdGF0aWMgaW50Citkcm1fZHBfcG9ydF9zZXRfcGR0
KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsIHU4IG5ld19wZHQsCisJCSAgICBib29sIG5l
d19tY3MpCiB7CiAJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IgPSBwb3J0LT5t
Z3I7CiAJc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiOwogCXU4IHJhZFs4XSwgbGN0Owog
CWludCByZXQgPSAwOwogCi0JaWYgKHBvcnQtPnBkdCA9PSBuZXdfcGR0KQorCWlmIChwb3J0LT5w
ZHQgPT0gbmV3X3BkdCAmJiBwb3J0LT5tY3MgPT0gbmV3X21jcykKIAkJcmV0dXJuIDA7CiAKIAkv
KiBUZWFyZG93biB0aGUgb2xkIHBkdCwgaWYgdGhlcmUgaXMgb25lICovCi0Jc3dpdGNoIChwb3J0
LT5wZHQpIHsKLQljYXNlIERQX1BFRVJfREVWSUNFX0RQX0xFR0FDWV9DT05WOgotCWNhc2UgRFBf
UEVFUl9ERVZJQ0VfU1NUX1NJTks6Ci0JCS8qCi0JCSAqIElmIHRoZSBuZXcgUERUIHdvdWxkIGFs
c28gaGF2ZSBhbiBpMmMgYnVzLCBkb24ndCBib3RoZXIKLQkJICogd2l0aCByZXJlZ2lzdGVyaW5n
IGl0Ci0JCSAqLwotCQlpZiAobmV3X3BkdCA9PSBEUF9QRUVSX0RFVklDRV9EUF9MRUdBQ1lfQ09O
ViB8fAotCQkgICAgbmV3X3BkdCA9PSBEUF9QRUVSX0RFVklDRV9TU1RfU0lOSykgewotCQkJcG9y
dC0+cGR0ID0gbmV3X3BkdDsKLQkJCXJldHVybiAwOwotCQl9CisJaWYgKHBvcnQtPnBkdCAhPSBE
UF9QRUVSX0RFVklDRV9OT05FKSB7CisJCWlmIChkcm1fZHBfbXN0X2lzX2RwX21zdF9lbmRfZGV2
aWNlKHBvcnQtPnBkdCwgcG9ydC0+bWNzKSkgeworCQkJLyoKKwkJCSAqIElmIHRoZSBuZXcgUERU
IHdvdWxkIGFsc28gaGF2ZSBhbiBpMmMgYnVzLAorCQkJICogZG9uJ3QgYm90aGVyIHdpdGggcmVy
ZWdpc3RlcmluZyBpdAorCQkJICovCisJCQlpZiAobmV3X3BkdCAhPSBEUF9QRUVSX0RFVklDRV9O
T05FICYmCisJCQkgICAgZHJtX2RwX21zdF9pc19kcF9tc3RfZW5kX2RldmljZShuZXdfcGR0LCBu
ZXdfbWNzKSkgeworCQkJCXBvcnQtPnBkdCA9IG5ld19wZHQ7CisJCQkJcG9ydC0+bWNzID0gbmV3
X21jczsKKwkJCQlyZXR1cm4gMDsKKwkJCX0KIAotCQkvKiByZW1vdmUgaTJjIG92ZXIgc2lkZWJh
bmQgKi8KLQkJZHJtX2RwX21zdF91bnJlZ2lzdGVyX2kyY19idXMoJnBvcnQtPmF1eCk7Ci0JCWJy
ZWFrOwotCWNhc2UgRFBfUEVFUl9ERVZJQ0VfTVNUX0JSQU5DSElORzoKLQkJbXV0ZXhfbG9jaygm
bWdyLT5sb2NrKTsKLQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfbXN0Yihwb3J0LT5tc3RiKTsK
LQkJcG9ydC0+bXN0YiA9IE5VTEw7Ci0JCW11dGV4X3VubG9jaygmbWdyLT5sb2NrKTsKLQkJYnJl
YWs7CisJCQkvKiByZW1vdmUgaTJjIG92ZXIgc2lkZWJhbmQgKi8KKwkJCWRybV9kcF9tc3RfdW5y
ZWdpc3Rlcl9pMmNfYnVzKCZwb3J0LT5hdXgpOworCQl9IGVsc2UgeworCQkJbXV0ZXhfbG9jaygm
bWdyLT5sb2NrKTsKKwkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X21zdGIocG9ydC0+bXN0Yik7
CisJCQlwb3J0LT5tc3RiID0gTlVMTDsKKwkJCW11dGV4X3VubG9jaygmbWdyLT5sb2NrKTsKKwkJ
fQogCX0KIAogCXBvcnQtPnBkdCA9IG5ld19wZHQ7Ci0Jc3dpdGNoIChwb3J0LT5wZHQpIHsKLQlj
YXNlIERQX1BFRVJfREVWSUNFX0RQX0xFR0FDWV9DT05WOgotCWNhc2UgRFBfUEVFUl9ERVZJQ0Vf
U1NUX1NJTks6Ci0JCS8qIGFkZCBpMmMgb3ZlciBzaWRlYmFuZCAqLwotCQlyZXQgPSBkcm1fZHBf
bXN0X3JlZ2lzdGVyX2kyY19idXMoJnBvcnQtPmF1eCk7Ci0JCWJyZWFrOworCXBvcnQtPm1jcyA9
IG5ld19tY3M7CiAKLQljYXNlIERQX1BFRVJfREVWSUNFX01TVF9CUkFOQ0hJTkc6Ci0JCWxjdCA9
IGRybV9kcF9jYWxjdWxhdGVfcmFkKHBvcnQsIHJhZCk7Ci0JCW1zdGIgPSBkcm1fZHBfYWRkX21z
dF9icmFuY2hfZGV2aWNlKGxjdCwgcmFkKTsKLQkJaWYgKCFtc3RiKSB7Ci0JCQlyZXQgPSAtRU5P
TUVNOwotCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIE1TVEIgZm9yIHBvcnQgJXAiLCBw
b3J0KTsKLQkJCWdvdG8gb3V0OwotCQl9CisJaWYgKHBvcnQtPnBkdCAhPSBEUF9QRUVSX0RFVklD
RV9OT05FKSB7CisJCWlmIChkcm1fZHBfbXN0X2lzX2RwX21zdF9lbmRfZGV2aWNlKHBvcnQtPnBk
dCwgcG9ydC0+bWNzKSkgeworCQkJLyogYWRkIGkyYyBvdmVyIHNpZGViYW5kICovCisJCQlyZXQg
PSBkcm1fZHBfbXN0X3JlZ2lzdGVyX2kyY19idXMoJnBvcnQtPmF1eCk7CisJCX0gZWxzZSB7CisJ
CQlsY3QgPSBkcm1fZHBfY2FsY3VsYXRlX3JhZChwb3J0LCByYWQpOworCQkJbXN0YiA9IGRybV9k
cF9hZGRfbXN0X2JyYW5jaF9kZXZpY2UobGN0LCByYWQpOworCQkJaWYgKCFtc3RiKSB7CisJCQkJ
cmV0ID0gLUVOT01FTTsKKwkJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgTVNUQiBmb3Ig
cG9ydCAlcCIsCisJCQkJCSAgcG9ydCk7CisJCQkJZ290byBvdXQ7CisJCQl9CiAKLQkJbXV0ZXhf
bG9jaygmbWdyLT5sb2NrKTsKLQkJcG9ydC0+bXN0YiA9IG1zdGI7Ci0JCW1zdGItPm1nciA9IHBv
cnQtPm1ncjsKLQkJbXN0Yi0+cG9ydF9wYXJlbnQgPSBwb3J0OworCQkJbXV0ZXhfbG9jaygmbWdy
LT5sb2NrKTsKKwkJCXBvcnQtPm1zdGIgPSBtc3RiOworCQkJbXN0Yi0+bWdyID0gcG9ydC0+bWdy
OworCQkJbXN0Yi0+cG9ydF9wYXJlbnQgPSBwb3J0OwogCi0JCS8qCi0JCSAqIE1ha2Ugc3VyZSB0
aGlzIHBvcnQncyBtZW1vcnkgYWxsb2NhdGlvbiBzdGF5cwotCQkgKiBhcm91bmQgdW50aWwgaXRz
IGNoaWxkIE1TVEIgcmVsZWFzZXMgaXQKLQkJICovCi0JCWRybV9kcF9tc3RfZ2V0X3BvcnRfbWFs
bG9jKHBvcnQpOwotCQltdXRleF91bmxvY2soJm1nci0+bG9jayk7CisJCQkvKgorCQkJICogTWFr
ZSBzdXJlIHRoaXMgcG9ydCdzIG1lbW9yeSBhbGxvY2F0aW9uIHN0YXlzCisJCQkgKiBhcm91bmQg
dW50aWwgaXRzIGNoaWxkIE1TVEIgcmVsZWFzZXMgaXQKKwkJCSAqLworCQkJZHJtX2RwX21zdF9n
ZXRfcG9ydF9tYWxsb2MocG9ydCk7CisJCQltdXRleF91bmxvY2soJm1nci0+bG9jayk7CiAKLQkJ
LyogQW5kIG1ha2Ugc3VyZSB3ZSBzZW5kIGEgbGluayBhZGRyZXNzIGZvciB0aGlzICovCi0JCXJl
dCA9IDE7Ci0JCWJyZWFrOworCQkJLyogQW5kIG1ha2Ugc3VyZSB3ZSBzZW5kIGEgbGluayBhZGRy
ZXNzIGZvciB0aGlzICovCisJCQlyZXQgPSAxOworCQl9CiAJfQogCiBvdXQ6CkBAIC0yMTUzLDEy
ICsyMTU0LDEyIEBAIGRybV9kcF9tc3RfcG9ydF9hZGRfY29ubmVjdG9yKHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaCAqbXN0YiwKIAkJZ290byBlcnJvcjsKIAl9CiAKLQlpZiAoKHBvcnQtPnBkdCA9
PSBEUF9QRUVSX0RFVklDRV9EUF9MRUdBQ1lfQ09OViB8fAotCSAgICAgcG9ydC0+cGR0ID09IERQ
X1BFRVJfREVWSUNFX1NTVF9TSU5LKSAmJgotCSAgICBwb3J0LT5wb3J0X251bSA+PSBEUF9NU1Rf
TE9HSUNBTF9QT1JUXzApIHsKLQkJcG9ydC0+Y2FjaGVkX2VkaWQgPSBkcm1fZ2V0X2VkaWQocG9y
dC0+Y29ubmVjdG9yLAotCQkJCQkJICZwb3J0LT5hdXguZGRjKTsKLQkJZHJtX2Nvbm5lY3Rvcl9z
ZXRfdGlsZV9wcm9wZXJ0eShwb3J0LT5jb25uZWN0b3IpOworCWlmIChwb3J0LT5wZHQgIT0gRFBf
UEVFUl9ERVZJQ0VfTk9ORSkgeworCQlpZiAoZHJtX2RwX21zdF9pc19kcF9tc3RfZW5kX2Rldmlj
ZShwb3J0LT5wZHQsIHBvcnQtPm1jcykpIHsKKwkJCXBvcnQtPmNhY2hlZF9lZGlkID0gZHJtX2dl
dF9lZGlkKHBvcnQtPmNvbm5lY3RvciwKKwkJCQkJCQkgJnBvcnQtPmF1eC5kZGMpOworCQkJZHJt
X2Nvbm5lY3Rvcl9zZXRfdGlsZV9wcm9wZXJ0eShwb3J0LT5jb25uZWN0b3IpOworCQl9CiAJfQog
CiAJbWdyLT5jYnMtPnJlZ2lzdGVyX2Nvbm5lY3Rvcihwb3J0LT5jb25uZWN0b3IpOwpAQCAtMjIy
Myw2ICsyMjI0LDcgQEAgZHJtX2RwX21zdF9oYW5kbGVfbGlua19hZGRyZXNzX3BvcnQoc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7
CiAJaW50IG9sZF9kZHBzID0gMCwgcmV0OwogCXU4IG5ld19wZHQgPSBEUF9QRUVSX0RFVklDRV9O
T05FOworCWJvb2wgbmV3X21jcyA9IDA7CiAJYm9vbCBjcmVhdGVkID0gZmFsc2UsIHNlbmRfbGlu
a19hZGRyID0gZmFsc2UsIGNoYW5nZWQgPSBmYWxzZTsKIAogCXBvcnQgPSBkcm1fZHBfZ2V0X3Bv
cnQobXN0YiwgcG9ydF9tc2ctPnBvcnRfbnVtYmVyKTsKQEAgLTIyNjcsNyArMjI2OSw3IEBAIGRy
bV9kcF9tc3RfaGFuZGxlX2xpbmtfYWRkcmVzc19wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5j
aCAqbXN0YiwKIAlwb3J0LT5pbnB1dCA9IHBvcnRfbXNnLT5pbnB1dF9wb3J0OwogCWlmICghcG9y
dC0+aW5wdXQpCiAJCW5ld19wZHQgPSBwb3J0X21zZy0+cGVlcl9kZXZpY2VfdHlwZTsKLQlwb3J0
LT5tY3MgPSBwb3J0X21zZy0+bWNzOworCW5ld19tY3MgPSBwb3J0X21zZy0+bWNzOwogCXBvcnQt
PmRkcHMgPSBwb3J0X21zZy0+ZGRwczsKIAlwb3J0LT5sZHBzID0gcG9ydF9tc2ctPmxlZ2FjeV9k
ZXZpY2VfcGx1Z19zdGF0dXM7CiAJcG9ydC0+ZHBjZF9yZXYgPSBwb3J0X21zZy0+ZHBjZF9yZXZp
c2lvbjsKQEAgLTIyOTUsNyArMjI5Nyw3IEBAIGRybV9kcF9tc3RfaGFuZGxlX2xpbmtfYWRkcmVz
c19wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJfQogCX0KIAotCXJldCA9
IGRybV9kcF9wb3J0X3NldF9wZHQocG9ydCwgbmV3X3BkdCk7CisJcmV0ID0gZHJtX2RwX3BvcnRf
c2V0X3BkdChwb3J0LCBuZXdfcGR0LCBuZXdfbWNzKTsKIAlpZiAocmV0ID09IDEpIHsKIAkJc2Vu
ZF9saW5rX2FkZHIgPSB0cnVlOwogCX0gZWxzZSBpZiAocmV0IDwgMCkgewpAQCAtMjMwOSw3ICsy
MzExLDggQEAgZHJtX2RwX21zdF9oYW5kbGVfbGlua19hZGRyZXNzX3BvcnQoc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoICptc3RiLAogCSAqIHdlJ3JlIGNvbWluZyBvdXQgb2Ygc3VzcGVuZC4gSW4g
dGhpcyBjYXNlLCBhbHdheXMgcmVzZW5kIHRoZSBsaW5rCiAJICogYWRkcmVzcyBpZiB0aGVyZSdz
IGFuIE1TVEIgb24gdGhpcyBwb3J0CiAJICovCi0JaWYgKCFjcmVhdGVkICYmIHBvcnQtPnBkdCA9
PSBEUF9QRUVSX0RFVklDRV9NU1RfQlJBTkNISU5HKQorCWlmICghY3JlYXRlZCAmJiBwb3J0LT5w
ZHQgPT0gRFBfUEVFUl9ERVZJQ0VfTVNUX0JSQU5DSElORyAmJgorCSAgICBwb3J0LT5tY3MpCiAJ
CXNlbmRfbGlua19hZGRyID0gdHJ1ZTsKIAogCWlmIChwb3J0LT5jb25uZWN0b3IpCkBAIC0yMzQ2
LDYgKzIzNDksNyBAQCBkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQoc3RydWN0IGRybV9kcF9t
c3RfYnJhbmNoICptc3RiLAogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7CiAJaW50IG9s
ZF9kZHBzLCBvbGRfaW5wdXQsIHJldCwgaTsKIAl1OCBuZXdfcGR0OworCWJvb2wgbmV3X21jczsK
IAlib29sIGRvd29yayA9IGZhbHNlLCBjcmVhdGVfY29ubmVjdG9yID0gZmFsc2U7CiAKIAlwb3J0
ID0gZHJtX2RwX2dldF9wb3J0KG1zdGIsIGNvbm5fc3RhdC0+cG9ydF9udW1iZXIpOwpAQCAtMjM3
Nyw3ICsyMzgxLDYgQEAgZHJtX2RwX21zdF9oYW5kbGVfY29ubl9zdGF0KHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaCAqbXN0YiwKIAlvbGRfZGRwcyA9IHBvcnQtPmRkcHM7CiAJb2xkX2lucHV0ID0g
cG9ydC0+aW5wdXQ7CiAJcG9ydC0+aW5wdXQgPSBjb25uX3N0YXQtPmlucHV0X3BvcnQ7Ci0JcG9y
dC0+bWNzID0gY29ubl9zdGF0LT5tZXNzYWdlX2NhcGFiaWxpdHlfc3RhdHVzOwogCXBvcnQtPmxk
cHMgPSBjb25uX3N0YXQtPmxlZ2FjeV9kZXZpY2VfcGx1Z19zdGF0dXM7CiAJcG9ydC0+ZGRwcyA9
IGNvbm5fc3RhdC0+ZGlzcGxheXBvcnRfZGV2aWNlX3BsdWdfc3RhdHVzOwogCkBAIC0yMzkwLDgg
KzIzOTMsOCBAQCBkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQoc3RydWN0IGRybV9kcF9tc3Rf
YnJhbmNoICptc3RiLAogCX0KIAogCW5ld19wZHQgPSBwb3J0LT5pbnB1dCA/IERQX1BFRVJfREVW
SUNFX05PTkUgOiBjb25uX3N0YXQtPnBlZXJfZGV2aWNlX3R5cGU7Ci0KLQlyZXQgPSBkcm1fZHBf
cG9ydF9zZXRfcGR0KHBvcnQsIG5ld19wZHQpOworCW5ld19tY3MgPSBjb25uX3N0YXQtPm1lc3Nh
Z2VfY2FwYWJpbGl0eV9zdGF0dXM7CisJcmV0ID0gZHJtX2RwX3BvcnRfc2V0X3BkdChwb3J0LCBu
ZXdfcGR0LCBuZXdfbWNzKTsKIAlpZiAocmV0ID09IDEpIHsKIAkJZG93b3JrID0gdHJ1ZTsKIAl9
IGVsc2UgaWYgKHJldCA8IDApIHsKQEAgLTM5NTgsNiArMzk2MSw4IEBAIGRybV9kcF9tc3RfZGV0
ZWN0X3BvcnQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlzd2l0Y2ggKHBvcnQt
PnBkdCkgewogCWNhc2UgRFBfUEVFUl9ERVZJQ0VfTk9ORToKIAljYXNlIERQX1BFRVJfREVWSUNF
X01TVF9CUkFOQ0hJTkc6CisJCWlmICghcG9ydC0+bWNzKQorCQkJcmV0ID0gY29ubmVjdG9yX3N0
YXR1c19jb25uZWN0ZWQ7CiAJCWJyZWFrOwogCiAJY2FzZSBEUF9QRUVSX0RFVklDRV9TU1RfU0lO
SzoKQEAgLTQ1OTcsNyArNDYwMiw3IEBAIGRybV9kcF9kZWxheWVkX2Rlc3Ryb3lfcG9ydChzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogCWlmIChwb3J0LT5jb25uZWN0b3IpCiAJCXBvcnQt
Pm1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7
CiAKLQlkcm1fZHBfcG9ydF9zZXRfcGR0KHBvcnQsIERQX1BFRVJfREVWSUNFX05PTkUpOworCWRy
bV9kcF9wb3J0X3NldF9wZHQocG9ydCwgRFBfUEVFUl9ERVZJQ0VfTk9ORSwgcG9ydC0+bWNzKTsK
IAlkcm1fZHBfbXN0X3B1dF9wb3J0X21hbGxvYyhwb3J0KTsKIH0KIAotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
